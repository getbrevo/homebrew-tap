# AGENTS.md

Guidance for AI coding agents working in this repository. Claude Code also reads
[`CLAUDE.md`](./CLAUDE.md), which mirrors this file.

## ⚠️ THIS IS A PUBLIC REPOSITORY

`github.com/getbrevo/homebrew-tap` is **public**. All files, commits, commit
messages, PR descriptions, and the full git history are permanently visible to
anyone and indexed by search engines. **Be cautious — assume a stranger reads
everything you write here.**

NEVER commit or reference:
- Secrets, tokens, API keys, passwords, or `.env` contents
- Internal Brevo hostnames, IPs, cluster names, or infrastructure details
- Internal-only URLs, dashboards, Jira ticket bodies, Slack/Notion links
- Customer or employee personal data
- Non-public architecture or process notes

If you find a leaked secret, do NOT just delete it in a follow-up commit (it remains
in history). Stop and tell the user so it can be rotated and history scrubbed.

Keep commit and PR text professional and free of internal jargon. Only public
formula data (download `url`, `sha256`) and public docs links belong here.

## What this repo is

A [Homebrew tap](https://docs.brew.sh/Taps) distributing Brevo developer tools.
It ships one formula today:

```
Formula/brevo.rb             # the @getbrevo/cli Homebrew formula
.github/workflows/tests.yml  # brew audit + install + test for PRs to Formula/
README.md                    # user-facing install instructions
```

Install command for users: `brew install getbrevo/tap/brevo`

## The formula is auto-bumped

`Formula/brevo.rb` `url` and `sha256` are updated automatically by a PR from the
`getbrevo/brevo-cli` release workflow whenever a new `@getbrevo/cli` version is
published to npm. CI must pass before a maintainer merges.

If editing the formula by hand:
- `url` → public npm tarball: `https://registry.npmjs.org/@getbrevo/cli/-/cli-<version>.tgz`
- `sha256` → must match that exact tarball. Compute it (`shasum -a 256 <file>`),
  never guess, or installs break.
- Keep `version`, `url`, and `sha256` mutually consistent.

## CI / validation

`tests.yml` runs on macOS for PRs touching `Formula/**`:
1. Taps the checked-out repo so it resolves as `getbrevo/tap/brevo`.
2. `brew audit --strict --online getbrevo/tap/brevo`
3. `brew install --build-from-source getbrevo/tap/brevo`
4. `brew test getbrevo/tap/brevo`

`brew audit/install/test <path>` is disabled in current Homebrew — reference the
formula **by name**, not by file path.

## Working agreements

- Keep changes minimal and scoped; this is packaging glue, not an application.
- Don't add formulae or workflows unless asked.
- **Never commit directly to `main`.** Always create a branch and open a pull request — `main` is protected and changes land only via reviewed PRs.
- Branch before committing; commit/push only when explicitly asked.
- Re-read the public-repo warning before every commit.
