---
name: v2-spec-executor
description: Execute an approved behavior spec and paired implementation plan from inherited history or explicit references, preserving their architecture and returning evidence. Use for bounded dual-file implementation; no particular planning skill or fork is required.
---

# V2 Spec Executor

Implement one approved V2 behavior spec according to its paired implementation plan. Keep implementation work in this execution task and return an evidence-bearing receipt.

## Resolve the contract

1. Resolve the approved pair from the latest `V2 SPEC READY` block or explicit user references. Later user corrections override prior instructions; material source changes require reconciling the pair, not silently ignoring either file. No specific producer skill or marker is required when the pair and approval are explicit.
2. Read both referenced files completely and require matching ready revisions.
3. Confirm the work is bounded and implementation is authorized. Work directly or in a user-authorized fork; a fork is not a prerequisite.
4. Apply:

```text
repository authority > spec behavior > implementation plan > execution choices
```

The spec decides what must be true; the plan decides the committed architecture, ownership, interfaces, flow, migration, and tests. Current repository paths may move, but the executor cannot silently substitute a different architecture.

Stop when either artifact is missing, draft, revision-mismatched, contradictory, materially invalidated by repository drift, or blocked by an unresolved decision or missing authority. Recommend tickets when the work needs independently owned or verifiable slices. Compaction alone is not a blocker.

## Lock execution

Inspect repository instructions, branch, `HEAD`, dirty state, recent relevant history, implementation, and agreed validation methods and actors. Record the actual pre-implementation `HEAD` as the review fixed point. Preserve unrelated user changes.

Send a short lock before editing:

```text
Executing: <observable outcome>
Behavior authority: <spec path and revision>
Technical authority: <plan path and revision>
In scope / out of scope: <compact lists>
Validation: <behavior seam and required gates>
External authority: <granted and ungranted actions>
```

## Implement

1. Before editing, trace every `AC-*` and `INV-*` to its plan coverage, current behavior and observable proof. For timing, identity and ownership, check actual producers, consumers and terminal conditions, including intervening work and cancellation. An ID mapping is not proof of a working interface; resolve material conflicts before expanding implementation.
2. For behavior changes, confirm the selected target, host dependencies and runner from configuration or applicable evidence; a discovered test name is not proof it can run. Follow the plan's migration order and probe uncertain fixtures in the first focused check: consumed event channel, registered subscriber, actual intercepted method, clock advancement and cancellation cleanup. Prefer existing barriers to scheduling sleeps. No full baseline suite or extra report is required.
3. Prove the narrowest complete vertical change through its real consumer before expanding to adjacent scenarios. Use test-first development where practical. Keep deviations explicit:
   - incidental adaptation: renamed or relocated code with unchanged architecture; record it in the receipt;
   - material deviation: changed ownership, contract, state flow, migration strategy, or behavior; stop and return to planning.
4. Run checks proportional to the changed behavior and repository rules. Documentation-only changes need document checks, not unrelated builds or tests. Modified tests must actually execute; no-match or all-skipped results are not passes. Reuse evidence only when relevant code, dependencies, configuration, tools and targets remain unchanged. Do not automatically append a full suite.
5. Review the final diff against the recorded fixed point, every spec criterion, and every committed plan decision. Follow required repository review rules; use specialist skills when useful, but do not require an optional skill to exist. Address in-scope findings.
6. Inspect final worktree state and separate this execution's changes from pre-existing work.

Local implementation and validation are in scope. Commit, push, PR, merge, deployment, tracker mutation, production data, costly real services, and messages require explicit authorization.

### Failure convergence

Distinguish product, fixture, compile/configuration and runner/environment failures before editing. Read the relevant diagnostics together; fix related compile errors in one batch. For repeated behavior failures, apply repository diagnosis thresholds, or otherwise diagnose after two failures with the same unresolved symptom or the first execution deadline overrun. Changing assertions or waits does not reset the count. The next experiment must identify new evidence, a hypothesis, one distinguishing change and its expected observation. Keep assertions that detect the defect, then expand from the focused fix to affected regression checks.

Retain exact job and result handles. An RPC wait timeout does not prove execution ended; confirm termination before restarting or switching runners. Missing validation infrastructure is a scoped gap to resolve, not permission to change product contracts or build unrelated tooling.

## Delegation and continuation

Delegate only when authorized and the task is independent enough to justify handoff. Give an implementer the contract, exact workspace, file ownership, and required evidence; the implementer owns the local change-validation-fix loop. If tools are only available to the parent, return exact diagnostics to the same implementer. The parent reviews integration changes without repeating still-valid checks. Coordinate exclusive use of shared build directories and runtime devices; do not edit relevant inputs during verification.

Before a context handoff or compaction, preserve source revisions, baseline plus dirty state, decisions, validation evidence, working and unavailable test entries, rejected hypotheses, latest failure logs, active job handles and the next distinguishing check. On resumption, reread the pair and reconcile actual workspace state before continuing. Split or return a partial receipt when state cannot be recovered or scope is no longer bounded; do not silently drop requirements or declare incomplete work complete.

## Developer acceptance

Follow the plan's validation methods, actors, scope, and handoff gate. For UI increments, complete agent-owned static and rendered checks before handing off; do not expand developer-owned experience checks into automated UI tests. Batch evidenced fixes and recheck affected areas, reusing applicable evidence. Stop tuning when the agreed agent checks pass and hand off the inspectable increment. Report pending developer acceptance in the receipt as partially completed; required acceptance remains unresolved until evidence arrives. Missing agent checks cannot be relabeled as developer acceptance.

## Return receipt

```text
V2 SPEC EXECUTION RECEIPT

- Conclusion: completed / partially completed / blocked
- Behavior source / revision:
- Technical source / revision:
- Review fixed point:
- Acceptance criteria: <each AC/INV with result and evidence>
- Plan conformance: <decisions followed and incidental adaptations>
- Main changes / changed files:
- Validation results:
- Review findings:
- Not validated or executed:
- Risks and remaining work:
- Planning decision needed:
- Branch / commit / review:
- Final worktree state:
- External effects:
- Goal / spec quality: <optional observation; not a completion gate>
```

Do not create a receipt file unless requested. Keep the block concise and redact secrets or personal data.
