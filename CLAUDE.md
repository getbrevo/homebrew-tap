# CLAUDE.md

Guidance for Claude Code (and other AI agents) working in this repository.

> See also [`AGENTS.md`](./AGENTS.md) — it carries the same guidance for non-Claude tools.

## ⚠️ THIS IS A PUBLIC REPOSITORY

`github.com/getbrevo/homebrew-tap` is **public**. Everything here — code, commits,
commit messages, PR descriptions, branch names, and the entire git history — is
permanently visible to the whole world and indexed by search engines and mirrors.

**Be cautious. Before writing, committing, or pushing anything, assume a stranger will read it.**

NEVER place any of the following in files, commits, PRs, or comments:
- Secrets, tokens, API keys, passwords, or `.env` contents
- Internal Brevo hostnames, IPs, cluster names, or infrastructure details
- Internal-only URLs, dashboards, Jira ticket bodies, or Slack/Notion links
- Customer data, employee personal data, or anything not already public
- Internal process notes that reveal non-public architecture

If you discover a leaked secret, STOP — do not just delete it in a new commit (it
stays in history). Flag it to the user so the credential can be rotated and history
purged.

Public-repo etiquette:
- Keep commit messages and PR text professional and free of internal jargon.
- Only the formula's public download `url` + `sha256` and public docs links belong here.

## What this repo is

A [Homebrew tap](https://docs.brew.sh/Taps) distributing Brevo developer tools on
macOS and Linux. Currently it ships exactly one formula:

```
Formula/brevo.rb          # the @getbrevo/cli Homebrew formula
.github/workflows/tests.yml  # brew audit + install + test on PRs to Formula/
README.md                 # user-facing install instructions
```

Users install via: `brew install getbrevo/tap/brevo`

## How the formula stays current (do not hand-edit casually)

`Formula/brevo.rb` `url` and `sha256` are **bumped automatically**. When a new
`@getbrevo/cli` version ships to npm, the `getbrevo/brevo-cli` release workflow opens
a PR here pointing at the new npm tarball. CI runs `brew audit` + `brew test` before a
maintainer merges.

If you change the formula by hand:
- `url` must point to the public npm registry tarball
  (`https://registry.npmjs.org/@getbrevo/cli/-/cli-<version>.tgz`).
- `sha256` must match that exact tarball — never invent or guess it. Compute it from
  the real downloaded file (`shasum -a 256 <file>`), or you will break installs.
- Keep `version` consistent with the `url`.

## CI / validation

`.github/workflows/tests.yml` runs on macOS for PRs touching `Formula/**`:
1. Taps the checked-out repo so the formula resolves as `getbrevo/tap/brevo`.
2. `brew audit --strict --online getbrevo/tap/brevo`
3. `brew install --build-from-source getbrevo/tap/brevo`
4. `brew test getbrevo/tap/brevo`

Note: `brew audit/install/test <path>` is disabled in current Homebrew — formulae
**must be referenced by name**, not by file path.

Locally, you can mirror CI with:
```bash
brew audit --strict --online getbrevo/tap/brevo
brew install --build-from-source getbrevo/tap/brevo
brew test getbrevo/tap/brevo
```

## Working agreements

- Keep changes minimal and scoped — this is packaging glue, not an application.
- Don't add formulae or workflows without the user asking.
- **Never commit directly to `main`.** Always create a branch and open a pull request — `main` is protected and changes land only via reviewed PRs.
- Branch before committing; commit/push only when the user explicitly asks.
- Re-read the public-repo warning above before every commit.
