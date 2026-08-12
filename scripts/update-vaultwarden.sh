#!/usr/bin/env bash
# ==============================================================================
# Bumps the Vaultwarden version this app ships.
#
# Resolves the latest upstream Vaultwarden release (or the version passed as the
# first argument), and if it differs from what the app currently ships, rewrites
# the Dockerfile, the app version in config.yaml and the README badge.
#
# The app version is kept in lockstep with the Vaultwarden version on purpose:
# this fork has no image: key, so the Home Assistant Supervisor builds the app
# locally and only offers an update when config.yaml's version changes.
#
# Usage: scripts/update-vaultwarden.sh [version]
# ==============================================================================
set -o errexit
set -o nounset
set -o pipefail

readonly repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly dockerfile="${repo_root}/vaultwarden/Dockerfile"
readonly config="${repo_root}/vaultwarden/config.yaml"
readonly readme="${repo_root}/README.md"

# Writes a key=value pair to the GitHub Actions step output, when running there.
output() {
    echo "${1}=${2}"
    if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
        echo "${1}=${2}" >> "${GITHUB_OUTPUT}"
    fi
}

fail() {
    echo "::error::${*}" >&2
    exit 1
}

target="${1:-}"
if [[ -z "${target}" ]]; then
    target=$(curl -fsSL \
        https://api.github.com/repos/dani-garcia/vaultwarden/releases/latest \
        | jq -r '.tag_name') \
        || fail "Could not resolve the latest Vaultwarden release"
fi
target="${target#v}"

[[ "${target}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] \
    || fail "Refusing to use '${target}', which is not a x.y.z version"

current=$(sed -n \
    's|^FROM "vaultwarden/server:\(.*\)" AS vaultwarden$|\1|p' "${dockerfile}")
[[ -n "${current}" ]] || fail "Could not read the current version from ${dockerfile}"

output "current" "${current}"
output "latest" "${target}"

# A release is tagged before its container image is pushed. That gap is normal,
# so treat it as "nothing to do yet" rather than an error, and let the next run
# pick the version up once the image lands.
if ! curl -fsSL -o /dev/null \
    "https://hub.docker.com/v2/repositories/vaultwarden/server/tags/${target}"
then
    echo "::warning::vaultwarden/server:${target} is not on Docker Hub yet"
    output "updated" "false"
    exit 0
fi

if [[ "${current}" == "${target}" ]]; then
    echo "Vaultwarden ${current} is already the latest release."
    output "updated" "false"
    exit 0
fi

echo "Updating Vaultwarden ${current} -> ${target}"

sed -i \
    "s|^FROM \"vaultwarden/server:.*\" AS vaultwarden$|FROM \"vaultwarden/server:${target}\" AS vaultwarden|" \
    "${dockerfile}"
sed -i "s|^version: .*$|version: ${target}|" "${config}"
sed -i \
    "s|^\(\[vaultwarden-version-shield\]: .*/badge/vaultwarden-\).*\(-blue\.svg\)$|\1${target}\2|" \
    "${readme}"

output "updated" "true"
