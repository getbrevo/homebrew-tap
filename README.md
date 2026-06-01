# getbrevo/homebrew-tap

Homebrew tap for [Brevo](https://www.brevo.com) developer tools.

## Brevo Developer CLI

Install the [Brevo Developer CLI](https://developers.brevo.com/docs/cli-reference)
(`@getbrevo/cli`) via Homebrew on macOS or Linux:

```bash
brew install getbrevo/tap/brevo
```

Then verify:

```bash
brevo --version
```

To upgrade later:

```bash
brew upgrade getbrevo/tap/brevo
```

### Other install methods

The CLI is also published to npm:

```bash
npm install -g @getbrevo/cli
```

## How this tap stays current

The `Formula/brevo.rb` `url` and `sha256` are bumped automatically: each time a new
`@getbrevo/cli` version is published to npm, the
[`getbrevo/brevo-cli`](https://github.com/getbrevo/brevo-cli) release workflow opens a
pull request here updating the formula to the new tarball. The PR runs `brew audit` and
`brew test` (see `.github/workflows/tests.yml`) before a maintainer merges it.

## License

The formula in this repository is provided under the MIT License. The Brevo Developer
CLI itself is distributed under its own [MIT License](https://www.npmjs.com/package/@getbrevo/cli).
