---
name: v2-to-goal
description: Compile one approved V2 frontier ticket together with its behavior spec and implementation plan into a verifiable execution goal. Use manually before a fresh implementation session; use --all only when the user explicitly requests a cross-ticket persistent goal.
disable-model-invocation: true
---

# V2 To Goal

Compile the dual-file planning pair and current ticket evidence into an execution contract. Keep the operation read-only: do not implement, edit tracker state, create branches, or write handoff files.

## Goal quality

Produce a self-contained outcome, authority, current state, completion criteria, execution constraints, and evidence requirements. If an available goal-crafter skill helps with target-harness formatting, use its compiled-handoff mode without re-interviewing. Its absence does not block this skill; do not invent harness commands or create a persistent goal unless requested.

## Resolve the frontier

Accept a ticket path, ticket identifier, parent V2 spec path, or no argument. With no argument, inspect the local tracker and select exactly one unblocked `ready-for-agent` ticket. If several tickets are on the frontier, ask the user to choose. If the requested ticket is blocked, report its blockers and stop.

When given a ticket reference, resolve it and state its title; ask only if the identity is ambiguous.

Read completely:

1. the selected ticket and comments;
2. its referenced `spec.md`;
3. its referenced `implementation-plan.md`;
4. directly linked contracts and decisions.

Require matching ready revisions and apply:

```text
repository authority > spec behavior > implementation plan > ticket > execution goal
```

Do not repair contradictions inside the goal. Route them to the owning artifact.

## Gather current evidence

Inspect repository instructions, branch, `HEAD`, worktree state, recent relevant commits, implementation, and tests. Record the pre-implementation `HEAD` as the review fixed point. Classify each ticket criterion as evidenced complete, demonstrably incomplete, or unverified. Treat commit messages as pointers, not proof.

Compare current code with both source files:

- behavioral drift means the spec needs review;
- invalidated ownership, interface, flow, or migration assumptions mean the plan needs review;
- harmless path or line movement may be resolved in the goal with current evidence.

## Scope and capacity

Default to one bounded frontier ticket. A fresh context is useful for transfer; compaction is permitted when authority and execution state remain recoverable. Preserve downstream blockers. For explicit `--all`, retain dependency order, mark the current frontier, carry partial evidence forward, and recommend a persistent goal loop.

Recommend the lowest reliable capability tier (`Lightweight`, `Standard`, or `Advanced`) and reasoning intensity (`Low`, `Medium`, or `High`) with one evidence-based sentence.

## Draft

Include:

- **Goal:** one ticket-scoped observable outcome;
- **Authority:** spec path/revision, plan path/revision, ticket path, and precedence rule;
- **Current state:** branch, fixed point, relevant dirty state, proven work, gaps, and existing failures;
- **Execution order:** the shortest plan-conformant path through this ticket;
- **Completion criteria:** every ticket criterion plus mapped `AC-*`/`INV-*`, validation, review, authorized commit, and final-worktree gates;
- **Implementation constraints:** the ticket's plan slice, module ownership, contracts, non-goals, and permitted adaptation to repository drift;
- **Context:** files, decisions, behavior seam, and commands to inspect first;
- **External authority:** preserve explicit permissions; default push, PR, merge, deployment, tracker edits, data changes, real-service calls, and messages to ungranted.

Do not copy the entire plan. Carry only the ticket's technical slice plus pointers to its authority.

## Deliver

Output only a readiness note, one copy-pasteable goal block, and the session recommendation. A single ticket uses a fresh execution session; explicit `--all` is labeled cross-context and uses a persistent goal loop.

The goal is ready only when its acceptance criteria cover the ticket and mapped spec IDs without changing them, its execution order conforms to the plan, its fixed point and dirty state are recorded, and its validation commands are discoverable from repository evidence.
