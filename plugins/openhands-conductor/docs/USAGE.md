# Usage

## Primary Command

```text
/orchestrate-review
```

Use it with a repository, PR diff, commit range, or pasted diff.

## Example Prompts

Review the current repository:

```text
/orchestrate-review Review the current repository for high-confidence issues.
```

Review a pasted diff:

```text
/orchestrate-review Review this diff. Focus on correctness, security, missing tests, and maintainability.
```

Review a commit range:

```text
/orchestrate-review Review changes between main and HEAD.
```

## Expected Output

The output should be a `Parallel Code Review Report` with:

- Task Graph
- Bug Risk
- Security Risk
- Test Coverage Gaps
- Maintainability
- Suggested Next Actions
- Unchecked Areas

## V0 Constraints

V0 is intentionally read-only. It can recommend changes, but it must not make them.

The reviewer may inspect files and run read-only commands. It must not apply patches, create commits, create PRs, push branches, or call external systems.

## Manual Trial Flow

1. Open a repository or provide a diff.
2. Run `/orchestrate-review`.
3. Confirm the task graph has four review lanes.
4. Confirm findings include evidence and recommendations.
5. Confirm the report states which checks were not run.
6. Confirm no files were edited.
