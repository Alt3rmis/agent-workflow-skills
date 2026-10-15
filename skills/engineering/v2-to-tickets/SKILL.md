---
name: v2-to-tickets
description: Slice an approved V2 behavior spec and implementation plan into dependency-ordered tracer-bullet tickets. Use manually after v2-to-spec when the work needs multiple fresh implementation contexts.
disable-model-invocation: true
---

# V2 To Tickets

Turn one approved dual-file V2 pair into independently verifiable vertical slices. Do not redesign the behavior or architecture while ticketing.

## Resolve inputs

Require both `spec.md` and `implementation-plan.md`, normally under the same `.scratch/<feature-slug>/` directory. Read them completely with referenced decisions and tracker comments.

Verify before slicing:

- both files are `ready` and have the same revision;
- the plan explicitly implements the spec;
- every `AC-*` and `INV-*` has plan coverage;
- no unresolved question gates execution.

Use this derivation rule:

```text
repository authority > spec behavior > implementation plan > ticket
```

Stop with `V2 TICKETS NOT READY` when a lower artifact conflicts with a higher one. Route behavioral gaps to `v2-to-spec`; route technical gaps to the implementation plan.

## Draft the graph

1. Inspect the current implementation only enough to validate the plan's seams and blast radius.
2. Split the plan into tracer-bullet slices that deliver a narrow, complete, testable behavior path and form a bounded implementation unit. Prefer a fresh context when useful, without making zero compaction an acceptance condition.
3. Preserve explicit plan sequence and identify genuine blocking edges. A ticket with no blockers is frontier-ready.
4. Use expand-migrate-contract tickets only when a wide mechanical refactor cannot land green as vertical slices.
5. Build a coverage table proving every `AC-*`, `INV-*`, migration step, and risk gate is owned by at least one ticket. Preserve the plan's validation methods, actors, scope, expected evidence, and any separate handoff/final acceptance gates. Avoid accidental duplicate ownership; identify intentional shared verification. A developer inspection criterion does not automatically require a new automated test.
6. Present the proposed titles, blockers, delivered behavior, and coverage IDs. Obtain approval for unresolved granularity, edges, and merge/split choices before publication; reuse explicit approval already present instead of asking twice.

## Publish

Use the repository's configured tracker. For local files, default to one file per approved ticket under:

```text
.scratch/<feature-slug>/issues/<NN>-<slug>.md
```

Number blockers first. Do not rewrite either source artifact during ticket publication. For an authorized external tracker, retain the same coverage and source revisions, use native blocking edges when available, and attach tickets to the source issue as sub-issues when supported. Parentage does not imply a dependency; do not close the parent. Do not publish externally without authorization.

```markdown
# <NN>: <Ticket title>

**Status:** ready-for-agent
**Blocked by:** <ticket IDs/titles or None: can start immediately>
**Behavior source:** ../spec.md
**Technical source:** ../implementation-plan.md
**Source revision:** <matching V2 revision>

## What to build
<One end-to-end behavior slice.>

## Contract coverage
- AC-...
- INV-...

## Plan slice
<Named decisions, migration steps, seams, and constraints this ticket realizes. Point to plan sections instead of copying them.>

**Acceptance:** <One sentence defining when this ticket is complete.>

## Acceptance criteria
- [ ] Independently checkable ticket criterion

## Validation
- <criterion, agreed validation method, responsible actor, scope, expected evidence, and repository gates>
- <agent handoff gate and final acceptance gate, if distinct; pending developer checks remain unresolved>

**Evidence:**

## Comments
```

Tickets may identify current modules or likely files when that bounds execution, but the implementation plan remains the technical authority. If repository drift invalidates the plan, the executor reports the mismatch instead of silently changing architecture in a ticket.

## Completion gate

Finish with ticket paths, the dependency-ordered graph, the current frontier, and the coverage table. The gate passes only when every source criterion is covered, every ticket is a bounded verifiable unit, all blocking edges are explicit, and all published tickets point to the same source revision.

The next implementation step can consume a ticket directly with `v2-implement`; Goal generation is optional for handoff, not a gate for executing each ticket.
