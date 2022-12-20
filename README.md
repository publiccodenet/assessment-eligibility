# Standard for a Public Code self-assessment

<!-- SPDX-License-Identifier: CC0-1.0 -->

Check if your codebase is ready for a full assessment by the [Foundation for Public Code](https://publiccode.net) towards the [Standard for Public Code](https://standard.publiccode.net/).

[![Deploy](https://github.com/publiccodenet/assessment-eligibility/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/publiccodenet/assessment-eligibility/actions/workflows/deploy.yml)

## Contribute

We welcome contributions, please create [issues](https://github.com/publiccodenet/assessment-eligibility/issues) and [pull requests](https://github.com/publiccodenet/assessment-eligibility/pulls).

## Building and testing

This tool is built upon [Choices](https://git.sr.ht/~bzg/choices) by [Bastien Guerry](https://sr.ht/~bzg/).
Choices is a ClojureScript project, and can be built with `lein`.
The build process uses `make`.
On debian-like systems, `lein` and `make` can be installed with `apt`:

```
sudo apt install leiningen make
```

To make changes, edit the `config.yml` file.

To build and view the site locally, run `make view`.

## Deploying

When the `develop` branch is merged to the `main` branch, the [deploy](.github/workflows/deploy.yml) script will run to update the site.

## License

All contributions must be submitted under [CC0 1.0](LICENSE).
