# Maintaining the fork

This repository has two remotes with different jobs:

- `upstream` is `mattpocock/skills`, the source of upstream releases.
- `origin` is `tt-a1i/matt-skills-with-to-goal`, the publication target for this fork.

The maintained branch is an **overlay**: upstream history stays intact, and fork-specific workflow changes sit on top. Resolve updates against the published fork intent. Historical branches may predate an upstream rebase; their ancestry alone is not evidence that their content should replace the current fork.

## Sync upstream

Start from a clean maintained branch and run:

```bash
npm run sync:upstream
```

The script fetches `upstream/main`, records a timestamped backup branch, and rebases every fork commit after the merge base onto the new upstream tip. If a conflict occurs, resolve it by intent and continue the rebase. The script never pushes.

After the rebase:

1. Review the complete overlay with `git diff upstream/main...HEAD`.
2. Update the upstream version and commit in `README.md` when they changed.
3. Keep `package.json` and `.claude-plugin/plugin.json` on the same fork version.
4. Run `npm run check-plugin-version`, `npm run lint:skills`, and `claude plugin validate . --strict`.
5. Run `npm run sync:local` after the repository state is accepted.

## Sync local agents

The machine-wide canonical source is `~/.agents_skills`. Claude Code, Codex, OpenCode, Pi, and `.agents` point to it. Hermes keeps a real copy because its discovery does not reliably follow symlinks.

```bash
npm run sync:local
```

The script backs up every affected canonical Skill under `~/.agents_skills/.bak-matt-sync-<timestamp>`, replaces only the promoted Skills owned by this repository, verifies each directory, then invokes the canonical Hermes sync script. It does not remove Skills owned by other repositories.

## Publish to the fork

Check the current branch tracking configuration and publish to an explicit `origin` destination. Use a review branch for an upstream sync; leave the published `main` unchanged until the PR is approved.

The first publication of this rewritten history must preserve the old remote tip with a backup branch or tag, then replace `origin/main` using `--force-with-lease`. That is a one-time destructive remote operation and requires explicit user authorization at action time. Later pushes follow the normal fork history.

Never push to `upstream`.

## Reviewable syncs without replacing main

For the 2026-10-10 sync, the guarded rebase prepared the overlay on upstream `49dd158`. The final review commit uses the reconciled tree with both published `origin/main` (`7b44372`) and upstream as parents. This preserves both histories without replaying duplicate fork commits into the published history or requiring a force push. The preparation branch is backed up locally.

Merge an upstream-sync PR with a merge commit, not squash or rebase, so upstream ancestry survives for the next sync. Keep local installs on the accepted repository state; preparing a PR does not update machine-wide Skills.
