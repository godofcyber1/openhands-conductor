param(
  [string]$PluginRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$ErrorActionPreference = "Stop"

function Assert-File {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "Missing required file: $Path"
  }
}

function Assert-Json {
  param([string]$Path)
  Assert-File $Path
  Get-Content -LiteralPath $Path -Encoding UTF8 | ConvertFrom-Json | Out-Null
}

function Assert-Contains {
  param(
    [string]$Path,
    [string]$Pattern
  )
  Assert-File $Path
  $match = Select-String -LiteralPath $Path -Pattern $Pattern -Encoding UTF8 -Quiet
  if (-not $match) {
    throw "Expected pattern '$Pattern' in $Path"
  }
}

Assert-Json (Join-Path $PluginRoot ".plugin\plugin.json")
Assert-Json (Join-Path $PluginRoot "templates\review-dag.json")
Assert-Json (Join-Path $PluginRoot "schemas\reviewer-output.schema.json")

Assert-File (Join-Path $PluginRoot "commands\orchestrate-review.md")
Assert-File (Join-Path $PluginRoot "agents\orchestrator.md")
Assert-File (Join-Path $PluginRoot "agents\bug_reviewer.md")
Assert-File (Join-Path $PluginRoot "agents\security_reviewer.md")
Assert-File (Join-Path $PluginRoot "agents\test_reviewer.md")
Assert-File (Join-Path $PluginRoot "agents\maintainability_reviewer.md")
Assert-File (Join-Path $PluginRoot "skills\task-graph.md")
Assert-File (Join-Path $PluginRoot "skills\review-report.md")
Assert-File (Join-Path $PluginRoot "skills\risk-summary.md")

Assert-Contains (Join-Path $PluginRoot "commands\orchestrate-review.md") "Do not edit files"
Assert-Contains (Join-Path $PluginRoot "agents\orchestrator.md") "Do not edit files"
Assert-Contains (Join-Path $PluginRoot "agents\bug_reviewer.md") "Do not edit files"
Assert-Contains (Join-Path $PluginRoot "agents\security_reviewer.md") "Do not edit files"
Assert-Contains (Join-Path $PluginRoot "agents\test_reviewer.md") "Do not edit files"
Assert-Contains (Join-Path $PluginRoot "agents\maintainability_reviewer.md") "Do not edit files"

$dag = Get-Content -LiteralPath (Join-Path $PluginRoot "templates\review-dag.json") -Encoding UTF8 | ConvertFrom-Json
if ($dag.nodes.Count -ne 4) {
  throw "Expected exactly 4 V0 review nodes, got $($dag.nodes.Count)"
}

foreach ($node in $dag.nodes) {
  if ($node.write_scope.Count -ne 0) {
    throw "V0 node '$($node.id)' must have an empty write_scope"
  }
}

Write-Output "openhands-conductor validation passed."
