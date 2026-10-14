# Maintaining the personal fork

- `origin`: `https://github.com/Alt3rmis/agent-workflow-skills.git`, the publication target.
- `upstream`: `https://github.com/tt-a1i/matt-skills-with-to-goal.git`, the direct source.
- Historical upstream: `mattpocock/skills`. Its changes arrive through the direct source unless deliberately reviewed separately.

## Review updates

Run `npm run sync:upstream` to fetch and inspect upstream. It does not merge, rebase, install, or push. Compare the recorded `upstream_reviewed_through` commit, the new upstream tip, and current skills. Port useful changes into `v2-*` without replacing their dual-file authority. Update `docs/v2/upstream-review.md` and the reviewed-through field after review, including rejected changes and reasons. Retain `derived_from` and imported hashes as historical provenance.

Preserve upstream skills as separately named alternatives. Keep project-specific paths, MCP choices, testing commands, and permission rules in consuming repositories. Never resolve divergence by forcing the V2 tree to match upstream.

## Validate and publish

Use a review branch; preserve published main until the user approves its PR. No force push or history rewrite is needed for routine maintenance. Run `npm run check-plugin-version`, `npm run lint:skills`, and `claude plugin validate . --strict`. Validate changed skill frontmatter and inspect behavior using realistic tasks; static checks cannot prove agent behavior. Keep package, lockfile and plugin versions aligned. Pending inherited Changesets use the personal package name so release tooling can resolve them; their descriptions and history remain intact. Publish only to explicit `origin`.

This repository uses its own version starting at `0.1.0`; upstream version and commit are provenance, not the personal release number. Consumers pin a release or commit and update deliberately.

## Installation is separate

Do not run `npm run sync:local` or `scripts/link-skills.sh` as part of editing, validation or publishing. They are inherited opt-in helpers that can replace same-name skills on this machine. Prefer installing named `v2-*` skills, and perform machine-wide changes only when explicitly requested. Publishing does not change the user's installed skills or the App repository's vendored copies.
