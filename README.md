# Home Assistant Community App: Vaultwarden (Fork)

> [!IMPORTANT]
> **This is a fork of [hassio-addons/app-vaultwarden][upstream], maintained for
> faster Vaultwarden updates.**
>
> The upstream app tends to lag behind Vaultwarden upstream releases. This fork
> exists to bump the bundled [Vaultwarden][vaultwarden] version (and its base
> image pins) as soon as new releases land, without waiting for the upstream
> release cycle.
>
> Everything else — configuration, options and behaviour — matches upstream. If
> you do not need the faster version bumps, use the [official app][upstream]
> instead.
>
> **Install:** add `https://github.com/KarlisKocins/app-vaultwarden` as a custom
> repository in the Home Assistant Supervisor app store.
>
> **Issues with this fork** go to [this repository's issue tracker][issue].
> Bugs in the app itself are best reported [upstream][upstream-issue], and bugs
> in Vaultwarden to the [Vaultwarden project][vaultwarden].

## Automatic updates

A [scheduled workflow][update-workflow] checks for new [Vaultwarden
releases][vaultwarden-releases] once a day. When it finds one, it bumps the
`vaultwarden/server` image and the app version, builds the app image to
confirm the change actually works, and only then commits to `main`. If the
build fails — usually a stale apt pin rather than the release itself — it
opens an issue instead of committing anything broken.

The app version tracks the Vaultwarden version, so the Home Assistant
Supervisor picks the bump up as a normal app update. Turn on **Auto update**
in the app's page in Home Assistant to have it install on its own; without it,
the update simply waits for you in the app store.

To check right now instead of waiting for the schedule, run the
`Vaultwarden update` workflow from the Actions tab. It also takes an optional
version, to pin to a specific release.

Locally, the same logic is one script:

```bash
./scripts/update-vaultwarden.sh          # latest release
./scripts/update-vaultwarden.sh 1.37.1   # a specific one
```

[![Vaultwarden Version][vaultwarden-version-shield]][vaultwarden-releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

[![Github Actions][github-actions-shield]][github-actions]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Open source password management solution.

## About

Bitwarden is an open-source password manager that can store sensitive
information such as website credentials in an encrypted vault.

The Bitwarden platform offers a variety of client applications including
a web interface, desktop applications, browser extensions and mobile apps.

This app is based upon the lightweight and opensource
[Vaultwarden][vaultwarden] implementation, allowing you to self-host
this amazing password manager.

This repository is a fork of the [Home Assistant Community App][upstream] by
Franck Nijhof, kept in sync with new Vaultwarden releases more aggressively
than upstream does.

Password theft is a serious problem. The websites and apps that you use are
under attack every day. Security breaches occur and your passwords are stolen.
When you reuse the same passwords everywhere hackers can easily access your
email, bank, and other important accounts. USE A PASSWORD MANAGER!

[:books: Read the full app documentation][docs]

![Bitwarden Preview](images/screenshot.png)

## Support

Got questions?

For anything specific to this fork (a missing version bump, a build issue here),
[open an issue on this repository][issue].

For questions about the app itself, the upstream channels are the place to go:

- The [Home Assistant Community Apps Discord chat server][discord] for app
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue upstream][upstream-issue] on GitHub.

## Contributing

Changes that are not fork-specific are best contributed
[upstream][upstream], so everyone benefits. Fork-specific fixes are welcome
here.

Upstream has set up a separate document containing their
[contribution guidelines](.github/CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].
This fork is maintained by [Kārlis Kociņš][maintainer].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## We have got some Home Assistant apps for you

Want some more functionality to your Home Assistant instance?

We have created multiple apps for Home Assistant. For a full list, check out
our [GitHub Repository][repository].

## License

MIT License

Copyright (c) 2019-2026 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[commits-shield]: https://img.shields.io/github/commit-activity/y/KarlisKocins/app-vaultwarden.svg
[commits]: https://github.com/KarlisKocins/app-vaultwarden/commits/main
[contributors]: https://github.com/hassio-addons/app-vaultwarden/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/KarlisKocins/app-vaultwarden/blob/main/vaultwarden/DOCS.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-bitwarden-rs/115573?u=frenck
[frenck]: https://github.com/frenck
[github-actions-shield]: https://github.com/KarlisKocins/app-vaultwarden/workflows/CI/badge.svg
[github-actions]: https://github.com/KarlisKocins/app-vaultwarden/actions
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[issue]: https://github.com/KarlisKocins/app-vaultwarden/issues
[license-shield]: https://img.shields.io/github/license/KarlisKocins/app-vaultwarden.svg
[maintainer]: https://github.com/KarlisKocins
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository
[update-workflow]: https://github.com/KarlisKocins/app-vaultwarden/blob/main/.github/workflows/vaultwarden-update.yaml
[upstream-issue]: https://github.com/hassio-addons/app-vaultwarden/issues
[upstream]: https://github.com/hassio-addons/app-vaultwarden
[vaultwarden-releases]: https://github.com/dani-garcia/vaultwarden/releases
[vaultwarden-version-shield]: https://img.shields.io/badge/vaultwarden-1.37.1-blue.svg
[vaultwarden]: https://github.com/dani-garcia/vaultwarden
