## What it does

Execute an approved pair with focused validation and an evidence receipt. The behavior spec and implementation plan remain distinct, matching authorities; a downstream artifact cannot silently redesign either.

## When to reach for it

Invoke /v2-spec-executor or let the agent select it for an explicitly approved pair and an implementation request. Use the dual-file route when the technical plan must survive handoff. Small clear edits do not require planning artifacts.

## Common questions

**Can I inspect UI increments myself?**

Yes, when the approved plan assigns that acceptance to you. The agent first completes its static and rendered checks, then hands off the increment with the remaining inspection scope. Pending required developer acceptance is reported as partial completion, not a pass.

**Can I pass two approved files without a READY marker?**

Yes, when both are ready, their revisions match, and implementation is authorized. A missing pair or incompatible revision remains a blocker.

**Does the V2 name mean an experimental second version?**

No. The name remains a compatible invocation entry. Repository releases use an independent version.

**Must all work fit one context window?**

No. Keep units bounded and preserve recoverable state. Compaction does not by itself invalidate approval or require new tickets.

**Does this replace project testing and permission rules?**

No. The consuming repository owns platform, commands, validation scope, and external-action permissions. Skill invocation never grants an unrelated push or deployment.

## It's working if

- UI handoffs show completed agent checks and any remaining developer acceptance separately.
- Behavior and architecture remain consistent through the handoff.
- Already settled decisions are retained without another interview.
- Missing evidence is visible rather than reported as completed work.

## Where it fits

This is part of the personal dual-file workflow. See [the design](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/v2/design.md) for preserved boundaries and [ask-matt](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/ask-matt.md) for optional routing. The upstream single-spec tools remain separate alternatives.
