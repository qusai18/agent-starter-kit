# Makes Claude Code see the shared .agents/ folder.
# Run from the repo root:  powershell -ExecutionPolicy Bypass -File scripts/setup-claude.ps1
# Uses a directory junction, which works on Windows without admin rights.

New-Item -ItemType Directory -Force -Path .claude | Out-Null

if (-not (Test-Path .claude/skills)) {
    New-Item -ItemType Junction -Path .claude/skills -Target (Resolve-Path .agents/skills) | Out-Null
    Write-Host "Linked .claude/skills -> .agents/skills"
}

# Claude reads subagents from .claude/agents. Copy them (re-run after edits).
New-Item -ItemType Directory -Force -Path .claude/agents | Out-Null
Copy-Item .agents/agents/*.md .claude/agents/ -Force
Write-Host "Copied subagents to .claude/agents (restart Claude Code to pick them up)"
