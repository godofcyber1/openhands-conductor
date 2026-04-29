# V0 Acceptance Checklist

Use this checklist to decide whether the V0 `parallel-code-review` plugin is usable.

## Plugin Shape

- [ ] `.plugin/plugin.json` exists and is valid JSON.
- [ ] `commands/orchestrate-review.md` exists.
- [ ] `agents/orchestrator.md` exists.
- [ ] Four read-only reviewer agents exist:
  - [ ] `bug_reviewer.md`
  - [ ] `security_reviewer.md`
  - [ ] `test_reviewer.md`
  - [ ] `maintainability_reviewer.md`
- [ ] Skills exist for task graph creation, report merging, and risk summary.
- [ ] `templates/review-dag.json` exists and is valid JSON.
- [ ] `schemas/reviewer-output.schema.json` exists and is valid JSON.

## Behavioral Contract

- [ ] The command says V0 is read-only.
- [ ] Every reviewer says not to edit files.
- [ ] The orchestrator requires a task graph before delegation.
- [ ] The orchestrator requires structured reviewer output.
- [ ] The report template includes:
  - [ ] Task Graph
  - [ ] Bug Risk
  - [ ] Security Risk
  - [ ] Test Coverage Gaps
  - [ ] Maintainability
  - [ ] Suggested Next Actions
  - [ ] Unchecked Areas

## V0 Demo Pass Criteria

- [ ] Given a repo or diff, the orchestrator can identify the review target.
- [ ] The review target is split into four independent read-only tasks.
- [ ] Each reviewer returns findings using the reviewer output contract.
- [ ] Findings are deduplicated in the final report.
- [ ] The final report does not claim commands were run unless they were actually run.
- [ ] The final report includes clear unchecked areas.

## Explicit Non-Goals

- [ ] No async scheduler.
- [ ] No file edits.
- [ ] No patch application.
- [ ] No PR creation.
- [ ] No remote push.
- [ ] No external side effects.
