#!/usr/bin/env bash
# Makes Claude Code see the shared .agents/ folder. Run from the repo root.
set -e
mkdir -p .claude/agents
[ -e .claude/skills ] || ln -s ../.agents/skills .claude/skills
cp .agents/agents/*.md .claude/agents/
echo "Linked skills and copied subagents. Restart Claude Code to pick up new agents."
