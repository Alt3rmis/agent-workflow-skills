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
3. Choose a validation seam that proves the affected behavior at proportionate cost. Inspect the existing consumer, fixture and relevant tests before committing to reuse; a fixture's name is not evidence of its capabilities. For UI work, apply the guidance below. Preserve an already approved seam unless concrete evidence shows a gap.
4. Draft both files with the same title, feature slug, status, and revision. Give each requirement a stable ID.
5. Run a cross-file audit:
   - every plan item maps to at least one `AC-*` or `INV-*`;
   - every acceptance criterion has an owner, data/state path, and verification seam in the plan;
   - the first implementation checkpoint exercises the chosen seam, with required fixture work and evidence limits explicit;
   - technical names, file paths, type shapes, and migration mechanics appear only in the plan;
   - open product or architecture decisions appear as blockers, not guessed solutions.
6. Publish a consistent pair. Keep both draft until both are complete and audited; do not claim a filesystem transaction across two writes. If publication is interrupted, neither is ready until their matching revision is rechecked.
7. Recommend direct or optional forked `v2-spec-executor` execution for bounded work; recommend tickets when independent slices or ownership boundaries justify them. Compaction alone does not require tickets. Invoking this skill does not authorize code changes, commits, pushes, or tracker publication beyond the user's request.

## Ground UI validation

Keep these decisions in the existing migration sequence and testing strategy, not a separate checklist or mandatory planning stage:

- **Visual-only change:** start with the changed component rendered in a representative state, then the required layout variants and affected interaction checks. Reuse valid interaction evidence where applicable; adding text or spacing alone does not require a new persistence or navigation harness.
- **Interaction or state change:** make the first checkpoint the thinnest real consumer path through action, state change and visible outcome, including return or reopen when affected. Exercise it before expanding implementation and regression coverage. Include first use without saved state when supported; preloaded fixtures alone cannot prove that path.

Inspect only the fixture capabilities this path needs: production state owner, action and return callbacks, scheduler or event delivery, and boundary response shapes. Distinguish reusable capabilities supported by current evidence, code-inspected capabilities awaiting execution, and known extensions needed. A static preview can prove layout, not save/return behavior. Lower-level tests supplement rather than replace affected UI evidence.

Specify the smallest fixture adaptation alongside its consumer and the observable result that ends the first checkpoint. Planned fixture work is not itself a readiness blocker when its scope and approach are known. Unknown feasibility that could change architecture or acceptance remains an open technical question. Planning does not authorize implementation or require running the application; label unexecuted checks honestly and schedule them first after implementation is authorized.

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
- AC-001 -> <owner, flow, verification seam>
- INV-001 -> <owner, invariant enforcement, verification seam>
## Current state and root cause
## Committed architecture decisions
## Ownership and module boundaries
## State and data flow
## Public interfaces and contracts
## Migration sequence
- First checkpoint: <smallest consumer path and observable result, before broader implementation>
## Testing strategy
- Reuse: <relevant evidence and its limits; inspected but unexecuted capabilities>
- Gaps: <required fixture adaptations and remaining scoped checks>
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
- Test seam: <highest agreed behavior seam>
- Non-goals: <explicit exclusions>
- External authority: <commit, push, review, deploy, tracker, data, and real-service permissions; default ungranted>
- Next route: v2-spec-executor (direct or optional fork) | v2-to-tickets
```

Otherwise end with `V2 SPEC NOT READY` and list the smallest unresolved decisions.
