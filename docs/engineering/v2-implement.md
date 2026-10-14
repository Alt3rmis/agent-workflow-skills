## What it does

Implements one ticket directly against its approved behavior spec and implementation plan. The ticket defines the execution slice; sibling tickets stay out of scope. It performs implementation, proportional validation, review, and authorized ticket evidence updates in one loop.

## When to reach for it

Type `/v2-implement <ticket-path-or-reference>`, or let the agent select it when you ask to implement or resume a specific V2 ticket. Use it after ticketing, or in a fresh session with just the ticket reference and access to its source files. No Goal conversion is required.

For a whole bounded spec instead, use [v2-spec-executor](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/v2-spec-executor.md).

## Prerequisites

A selected ticket with resolved blockers, acceptance criteria, and references to an approved, ready behavior spec and implementation plan at the same revision. The implementation workspace and required verification tools must be available.

## Common questions

**Do I need to generate a Goal for every ticket?**

No. The ticket and its sources already provide the execution contract. Use [v2-to-goal](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/v2-to-goal.md) only when a portable summary helps an explicit handoff. A fresh session alone does not require one.

**Why not use the original implement skill?**

The upstream alternative retains its full-suite and commit defaults. This skill respects the V2 technical plan, validates the changed scope, and requires separate authority for commits and external writes. It does not invoke the old implement skill.

## It's working if

- Passing one ticket does not depend on finishing unrelated siblings.
- Modified tests actually run, while a documentation edit avoids unrelated builds.
- A blocked ticket stays unresolved with a concrete explanation.
- Successful authorized local execution leaves acceptance evidence on that ticket.

## Where it fits

The direct ticket route is `v2-to-spec → v2-to-tickets → v2-implement`. Small clear edits can proceed without planning artifacts; Goal generation remains an optional handoff aid. The [optional catalog](https://github.com/Alt3rmis/agent-workflow-skills/blob/main/docs/engineering/ask-matt.md) describes the available alternatives.
