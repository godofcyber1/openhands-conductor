---
name: orchestrate-review
description: Review a repository or PR diff using a read-only task graph and specialized subagents.
---

# /orchestrate-review

Use this command to run a read-only parallel code review.

## Inputs

Accept one of:

- Current repository state.
- A PR diff.
- A commit range.
- A pasted diff or patch.
- A user-described change area.

If no explicit input is provided, inspect the current repository and available git context before deciding the review target.

## Orchestrator Workflow

1. Identify the review target.
2. Build a read-only review DAG with these nodes:
   - `bug_review`
   - `security_review`
   - `test_review`
   - `maintainability_review`
3. Delegate each node to the matching reviewer when possible.
4. Require every reviewer to return structured findings.
5. Merge findings into the final report.
6. Do not edit files, apply patches, create PRs, push branches, or run destructive commands.

## Final Report Format

```markdown
# Parallel Code Review Report

## Task Graph

| Task | Agent | Status | Risk |
| --- | --- | --- | --- |
| bug_review | bug_reviewer | done | ... |
| security_review | security_reviewer | done | ... |
| test_review | test_reviewer | done | ... |
| maintainability_review | maintainability_reviewer | done | ... |

## Bug Risk

...

## Security Risk

...

## Test Coverage Gaps

...

## Maintainability

...

## Suggested Next Actions

...
```

## Constraints

- Read-only by default.
- Prefer precise file and line references when available.
- Report uncertainty explicitly.
- Do not claim tests passed unless commands were actually run.
- Do not produce implementation patches in V0.
