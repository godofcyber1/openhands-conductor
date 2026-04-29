---
name: review-report
description: Merge structured reviewer outputs into a concise parallel code review report.
trigger:
  type: keyword
  keywords:
    - review report
    - findings
    - merge review
    - suggested next actions
---

# Review Report Skill

Merge reviewer outputs into one report with these sections:

```markdown
# Parallel Code Review Report

## Task Graph

## Bug Risk

## Security Risk

## Test Coverage Gaps

## Maintainability

## Suggested Next Actions

## Unchecked Areas
```

Deduplicate overlapping findings. Prefer high-confidence, high-impact issues first.

Do not claim tests passed unless the reviewer actually ran them.
