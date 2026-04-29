---
name: task-graph
description: Build a small read-only task graph before delegating code review work.
trigger:
  type: keyword
  keywords:
    - orchestrate
    - task graph
    - parallel review
    - code review
---

# Task Graph Skill

Before delegating review work, create a DAG with explicit task IDs, reviewer roles, dependencies, write scopes, risk levels, and expected artifacts.

For V0, all review tasks are independent and read-only:

```json
{
  "nodes": [
    {"id": "bug_review", "deps": [], "write_scope": []},
    {"id": "security_review", "deps": [], "write_scope": []},
    {"id": "test_review", "deps": [], "write_scope": []},
    {"id": "maintainability_review", "deps": [], "write_scope": []}
  ]
}
```

Do not schedule write tasks in V0.
