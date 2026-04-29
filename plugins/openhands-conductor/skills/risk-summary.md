---
name: risk-summary
description: Summarize review risk levels, confidence, unchecked areas, and recommended next actions.
trigger:
  type: keyword
  keywords:
    - risk
    - unchecked
    - confidence
    - next actions
---

# Risk Summary Skill

When summarizing review results, include:

- Highest severity finding.
- Overall confidence.
- Areas not inspected.
- Commands not run.
- Next action with the best risk reduction.

If the review is based only on static reading, say that explicitly.
