# OpenHands Conductor

OpenHands Conductor is a V0 plugin for read-only parallel code review.

It does not implement a true async scheduler yet. V0 uses OpenHands sub-agent delegation to split review work across specialized reviewers, then merges their structured findings into one report.

## Command

```text
/orchestrate-review
```

Use this command when you want an OpenHands agent to review a repository, PR diff, commit range, or pasted diff using multiple specialized reviewers.

## Usage

See `docs/USAGE.md` for example prompts and a manual trial flow.

## V0 Scope

- Read-only review only.
- No file edits.
- No patch application.
- No PR creation.
- No external side effects.
- No MCP async scheduler.

## Review Lanes

- Bug risk: correctness, regressions, edge cases.
- Security risk: auth, injection, secrets, unsafe external calls.
- Test coverage gaps: missing tests, weak assertions, untested paths.
- Maintainability: complexity, coupling, naming, style drift.

## Output Contract

The orchestrator should produce:

- Task graph summary.
- Per-reviewer structured findings.
- Merged review report.
- Risk summary.
- Suggested next actions.

See:

- `templates/review-dag.json` for the V0 DAG template.
- `schemas/reviewer-output.schema.json` for the reviewer output contract.
- `templates/parallel-code-review-report.md` for the final report shape.

## Local Validation

Run the PowerShell validation script from the plugin root or repository root:

```powershell
.\plugins\openhands-conductor\scripts\validate-plugin.ps1
```

The script checks required files, JSON validity, read-only constraints, and the four-node V0 review DAG.

## Examples

- `examples/sample-diff.diff` contains a small review target.
- `examples/sample-report.md` shows the expected report style.

## Roadmap

V0 validates read-only parallel code review.

V1 adds patch-first `fix-issue` workflows.

V2 adds an MCP async scheduler with task IDs, polling, write locks, and artifact merging.
