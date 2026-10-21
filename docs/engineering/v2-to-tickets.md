## What it does

Split an approved pair into dependency-ordered, independently verifiable tickets. The behavior spec and implementation plan remain distinct, matching authorities; a downstream artifact cannot silently redesign either.

## When to reach for it

Invoke /v2-to-tickets explicitly; it is not automatically selected. Use the dual-file route when the technical plan must survive handoff. Small clear edits do not require planning artifacts.

## Common questions

**Does ticketing turn manual UI acceptance into automated tests?**

No. Tickets retain the plan's validation methods and responsible actors. They distinguish an increment ready for developer inspection from final acceptance, so pending human checks neither disappear nor become new automation requirements.

**Must each ticket be a different software layer?**

No. Prefer complete behavior slices with explicit blockers. Keep parent issue relationships separate from dependency edges.

**Should testing infrastructure always be a separate first ticket?**

No. The earliest relevant behavior slice proves an uncertain seam before dependent scenarios expand. Shared setup gets one owner and reusable evidence; a separate infrastructure ticket is justified only by a real, independently scoped prerequisite. Tests stay with their behavior, rather than accumulating in a final ticket.

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

A ticket can be executed directly with [v2-implement](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/v2-implement.md). Goal generation is optional, including when starting a fresh session.
