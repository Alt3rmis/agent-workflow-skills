## What it does

Split an approved pair into dependency-ordered, independently verifiable tickets. The behavior spec and implementation plan remain distinct, matching authorities; a downstream artifact cannot silently redesign either.

## When to reach for it

Invoke /v2-to-tickets explicitly; it is not automatically selected. Use the dual-file route when the technical plan must survive handoff. Small clear edits do not require planning artifacts.

## Common questions

**Must each ticket be a different software layer?**

No. Prefer complete behavior slices with explicit blockers. Keep parent issue relationships separate from dependency edges.

**Where does missing UI fixture support belong?**

Keep the smallest required adaptation in the ticket that exercises it, along with the plan's first observable consumer checkpoint. A known fixture gap does not require a separate setup ticket. A fixture that cannot support the approved approach is a plan issue to reconcile before publication, not a hidden implementation assumption.

**Does the V2 name mean an experimental second version?**

No. The name remains a compatible invocation entry. Repository releases use an independent version.

**Must all work fit one context window?**

No. Keep units bounded and preserve recoverable state. Compaction does not by itself invalidate approval or require new tickets.

**Does this replace project testing and permission rules?**

No. The consuming repository owns platform, commands, validation scope, and external-action permissions. Skill invocation never grants an unrelated push or deployment.

## It's working if

- Behavior and architecture remain consistent through the handoff.
- Already settled decisions are retained without another interview.
- Missing evidence is visible rather than reported as completed work.
- A ticket identifies the first working consumer path and its fixture needs, not just a list of eventual test suites.

## Where it fits

This is part of the personal dual-file workflow. See [the design](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/v2/design.md) for preserved boundaries and [ask-matt](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/ask-matt.md) for optional routing. The upstream single-spec tools remain separate alternatives.

A ticket can be executed directly with [v2-implement](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/v2-implement.md). Goal generation is optional, including when starting a fresh session.
