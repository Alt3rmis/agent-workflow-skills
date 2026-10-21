---
name: v2-to-spec
description: Publish the settled conversation as an approved behavior spec and a separate committed implementation plan for a repository, preserving approved behavior and technical decisions.
disable-model-invocation: true
---

# V2 To Spec

Synthesize settled conversation and repository evidence into two co-authoritative artifacts. Do not re-interview the user or implement the work.

## Contract

Use the repository's planning location, defaulting to one feature directory:

```text
.scratch/<feature-slug>/spec.md
.scratch/<feature-slug>/implementation-plan.md
```

`spec.md` owns required behavior. `implementation-plan.md` owns the committed technical approach for that behavior. Repository constitution, requirements, contracts, and ADRs remain higher authority than either file.

Apply this derivation rule downstream:

```text
repository authority > spec behavior > implementation plan > ticket > execution goal
```

A lower layer may add detail but cannot change a higher layer. Any material conflict makes the pair not ready.

## Process

1. Read the relevant repository instructions, requirements, contracts, ADRs, implementation, and tests. Use the project domain vocabulary.
2. Classify every settled statement as behavioral, technical, open, rejected, or out of scope. Preserve decisions; do not invent missing ones.
3. Choose the smallest sufficient validation method for each criterion using the guidance below. Reuse existing evidence and seams; share a check across criteria when it proves them. Distinguish capabilities supported by inspected code or applicable run evidence from extensions to build and assumptions to probe. Name the first complete behavior slice that will prove an uncertain seam during implementation. Planning does not require running tests or re-approving agreed validation decisions; an unresolved architecture decision is still a blocker.
4. Draft both files with the same title, feature slug, status, and revision. Give each requirement a stable ID.
5. Run a cross-file audit:
   - every plan item maps to at least one `AC-*` or `INV-*`;
   - every acceptance criterion has an implementation owner, a data/state path where applicable, and a validation method, responsible actor, scope, and expected evidence in the plan;
   - for timing, identity or asynchronous ownership requirements, trace the defining event or value from its producer through the consumer to the terminal condition. Account for intervening work, cancellation and replacement where relevant. Name any missing interface as planned work; an AC label or a test-harness name alone is not coverage;
   - technical names, file paths, type shapes, and migration mechanics appear only in the plan;
   - open product or architecture decisions appear as blockers, not guessed solutions.
6. Publish a consistent pair. Keep both draft until both are complete and audited; do not claim a filesystem transaction across two writes. If publication is interrupted, neither is ready until their matching revision is rechecked.
7. Recommend direct or optional forked `v2-spec-executor` execution for bounded work; recommend tickets when independent slices or ownership boundaries justify them. Compaction alone does not require tickets. Invoking this skill does not authorize code changes, commits, pushes, or tracker publication beyond the user's request.

## Validation choices

Verification does not imply an automated test for every criterion. Record the method, responsible actor (agent or developer), affected region/states, and expected evidence in the plan's `Testing strategy`. Repository rules and explicit acceptance contracts remain binding.

| Criterion | Sufficient evidence to plan |
|---|---|
| Static UI properties such as spacing, typography, colors, or assets | Agent checks against the approved design or tokens, plus rendered inspection of affected layout, wrapping, clipping, and placement. Code values alone do not prove rendered layout. |
| Interaction feel or complex user journeys | Developer runtime acceptance when assigned by the user or repository; retain agent checks for changed behavior. |
| State, navigation logic, persistence, concurrency, or external effects | Focused behavior tests or integration checks at the boundary affected by the change. |

For UI work, plan one inspectable increment at a time. Fix evidenced mismatches together, then recheck the affected region. Expand device/state coverage only for an explicit contract, shared-consumer impact, or observed risk. Pure visual edits do not by themselves require new UI automation, whole-package tests, a full suite, or repeated installation after each small edit. Preserve existing specialized contracts and any tests affected by the change.

Define both the agent handoff gate and final acceptance gate when developer inspection is required. The handoff gate requires applicable agent checks, relevant compilation evidence, and static rendering evidence; missing required checks remain visible gaps. Pending developer acceptance is neither a pass nor a reason to keep inventing automated checks. Keep final acceptance unresolved until the required evidence arrives, and preserve that distinction through tickets, goals, and execution receipts. Stop visual tuning when agreed checks pass; subjective refinements need developer feedback or a clarified design basis.

## `spec.md` template

```markdown
# <Feature>: Behavior Spec

**Status:** draft | ready
**Revision:** <date or revision>
**Pair:** implementation-plan.md

## Problem
## Goals
## Non-goals
## User stories
- US-001: As a ..., I want ..., so that ...
## Acceptance criteria
- AC-001: Given ... when ... then ...
## Behavioral rules
## System invariants
- INV-001: ...
## Edge and failure behavior
## Out of scope
## Open product questions
```

Keep this file readable by product, QA, and engineering. Describe observable behavior and externally meaningful constraints. Exclude code symbols, file paths, lifecycle hooks, storage mechanisms, and proposed module shapes.

## `implementation-plan.md` template

```markdown
# <Feature>: Implementation Plan

**Status:** draft | ready
**Revision:** <same revision as spec>
**Implements:** spec.md

## Contract coverage
- AC-001 -> <implementation owner, flow if applicable, validation method / actor / scope / evidence>
- INV-001 -> <owner, invariant enforcement, validation method / actor / scope / evidence>
## Current state and root cause
## Committed architecture decisions
## Ownership and module boundaries
## State and data flow
## Public interfaces and contracts
## Migration sequence
## Testing strategy
<Criterion-to-validation mapping; agent handoff gate and final acceptance gate when distinct.>
## Observability and failure handling
## Rejected alternatives
## Open technical questions
## Risks and rollback
```

This file may name modules, symbols, interfaces, paths, state machines, and test seams. Record only decisions supported by the conversation and repository evidence. Mark repository-sensitive paths as current evidence, not timeless requirements.

## Ready gate

End only a valid pair with:

```text
V2 SPEC READY

- Status: ready for implementation
- Behavior source: <absolute or repository-relative spec.md path>
- Technical source: <absolute or repository-relative implementation-plan.md path>
- Revision: <matching revision>
- Repository / baseline: <repository and commit or branch>
- Test seam: <agreed validation methods, actors, scope, and evidence; may include non-automated checks>
- Non-goals: <explicit exclusions>
- External authority: <commit, push, review, deploy, tracker, data, and real-service permissions; default ungranted>
- Next route: v2-spec-executor (direct or optional fork) | v2-to-tickets
```

Otherwise end with `V2 SPEC NOT READY` and list the smallest unresolved decisions.
