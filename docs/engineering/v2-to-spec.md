## What it does

Publish approved behavior and implementation plans as a consistent pair. The behavior spec and implementation plan remain distinct, matching authorities; a downstream artifact cannot silently redesign either.

## When to reach for it

Invoke /v2-to-spec explicitly; it is not automatically selected. Use the dual-file route when the technical plan must survive handoff. Small clear edits do not require planning artifacts.

## Common questions

**Can an existing preview or test fixture be assumed to cover a UI flow?**

No. The plan distinguishes what the fixture actually exercises, what has only been inspected in code, and what needs extending. A static view can show layout without owning state or delivering a save callback. Known fixture work belongs with the first consumer checkpoint; an architecture-changing uncertainty remains open.

**Does this add a testing phase before every plan can be approved?**

No. Planning inspects relevant evidence without implementing or requiring an application run. A visual-only change starts with a representative render and its required checks. An interaction change starts with the smallest real action-to-outcome path after implementation is authorized, before broad regression work.

**Must I repeat decisions already approved in conversation?**

No. The skill synthesizes settled evidence. Only missing or contradictory decisions prevent marking the pair ready.

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
- The first implementation checkpoint reveals whether the chosen UI fixture can prove the required behavior.
- A small visual edit does not acquire an unrelated save or navigation test harness.

## Where it fits

This is part of the personal dual-file workflow. See [the design](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/v2/design.md) for preserved boundaries and [ask-matt](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/ask-matt.md) for optional routing. The upstream single-spec tools remain separate alternatives.
