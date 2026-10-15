---
name: v2-implement
description: Implement one V2 ticket directly from its approved behavior spec and implementation plan, with scoped validation and ticket evidence. Use when asked to implement, resume, or finish a specific ticket; no Goal conversion or new session is required.
---

# V2 Implement

Finish one authorized ticket through implementation, validation, and evidence. The ticket is the execution input; do not require a Goal, another planning skill, a fork, or a new session.

## Resolve and bound the ticket

Accept a local ticket path or tracker reference. Resolve it and state its title. With no argument, use the repository's tracker only when exactly one unblocked ticket is ready; otherwise ask which ticket. Do not choose a different ticket when the requested one is blocked.

Read repository instructions, the ticket and its comments, its referenced behavior spec and implementation plan, and relevant contracts. Resolve relative references from the ticket's directory, following documented repository conventions. Both source files must be approved and ready with matching revisions, and the ticket must bind that revision. If a path is stale, locate the unambiguous authority and report the resolution; never guess between different plans.

Apply:

```text
repository authority > spec behavior > implementation plan > ticket > execution choices
```

Check actual blocker states and evidence. An unresolved blocker, contradictory contract, missing or stale source revision, or materially invalidated plan blocks implementation; report the precise gap without rewriting the authority or generating a replacement Goal. Ask only for missing decisions. Preserve approvals and permissions already established.

Lock scope to this ticket's acceptance criteria, mapped spec IDs, and plan slice. Apply shared invariants where the slice touches them. Do not implement or require completion of sibling tickets or the whole parent spec. If this ticket cannot complete without new prerequisite work, surface that dependency rather than silently expanding scope.

## Start or resume

Inspect the exact workspace, branch, HEAD, dirty state, current implementation, and existing validation evidence. Reuse applicable work; preserve unrelated changes. Check ownership before resuming a claimed ticket, and do not take another implementer's active claim. For a resolved ticket, verify its evidence against the request before making new changes; do not reopen it automatically.

Briefly state the ticket, source revision, in-scope behavior, required validation, and permission boundary. Begin implementation without asking the user to approve an already approved scope again.

For a local tracker whose repository conventions authorize lifecycle updates, mark this ticket claimed before editing implementation. Otherwise keep the execution state in the response until tracker edits are authorized. External tracker writes, commit, push, PR, merge, deployment, production operations, and messages need explicit authority; a request to implement alone does not grant them. Lack of external tracker write permission does not prevent otherwise authorized local implementation.

## Implement and verify

1. Trace the selected acceptance criteria to the smallest complete behavior slice and observable checks. Follow the approved plan's ownership, interfaces, migration order, and test seams. If no first checkpoint is named, derive it within that approved sequence and seam; missing wording alone does not require replanning. Record incidental path adaptations; reconcile material architecture or behavior changes with their owning source before proceeding.
2. Complete the plan's first consumer checkpoint, including necessary fixture adaptations, before broadening implementation and regressions. Check actual fields, access levels and target dependencies when wiring a new public seam; use its focused test to compile and exercise the consumer. For visual-only work, render the changed component first. For interaction/state work, exercise the real action and visible outcome, not only a static fixture. Use test-first development where useful; optional testing or review skills are aids, not prerequisites.
3. Run checks proportional to this ticket and repository rules. Documentation-only changes need relevant document checks. Added or changed tests must run and select the intended cases; a build, no matches, or all skipped cases cannot stand in for passing tests. Do not append a full suite by default. On a UI failure, inspect the rendered state, UI hierarchy and action/callback evidence to locate the failing layer before rerunning. Use semantic targets and sufficient visibility; exact coordinates or timing are assertions only when the contract requires them. Change the evidenced cause while preserving the behavior assertion, rather than guessing another selector or weakening the expected outcome.
4. Retain required screenshots and results when produced, before temporary artifacts expire. Reuse evidence only while its relevant code, dependencies, configuration, toolchain, target and test scope remain unchanged. If an implementer lacks a tool, the parent may run the exact check and return diagnostics to that same implementer. Serialize shared build and runtime resources; never overlap uncertain running jobs.
5. Review the final diff against this ticket's criteria and applicable spec and plan constraints. Follow repository-required reviews and resolve in-scope findings. Distinguish unavailable checks or environmental failures from implementation defects; required missing evidence prevents a completed result.

Delegate only within existing authority and where independent work justifies it. Each implementer owns its fix-and-verify loop; the parent integrates without repeating valid checks. Before compaction or handoff, preserve ticket/source revisions, baseline and dirty state, evidence, active operations, and next step. Resume by reconciling the actual workspace. A Goal is optional when an explicit handoff benefits from it.

## Finish this ticket

When all selected acceptance criteria and necessary checks pass, append concise evidence and mark only this ticket resolved if tracker mutation is authorized. Follow the repository's status vocabulary. Preserve previous evidence and comments; do not close the parent, advance sibling tickets, or create extra receipt files by default.

If blocked or incomplete, leave the ticket unresolved and record the remaining criterion, failure or missing evidence in its authorized Comments/Evidence area. If writes are unavailable, include the proposed update in the response. Never mark resolved merely because code is written.

Return a compact receipt: ticket and source revision, completed/partial/blocked outcome, changed files, acceptance-to-evidence results, review findings, unverified boundaries, tracker update status, and final branch/dirty state. Then stop; do not start the next ticket without an instruction that covers it.
