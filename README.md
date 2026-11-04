# Agent Starter Kit

A drop-in setup for working with coding agents (Claude Code, Codex, Cursor,
OpenCode, Copilot) in any project. Based on Alexey Grigorev's Coding Agent
Setup Kit and his AI Dev Tools Zoomcamp posts.

## What's inside

| Path | What it's for |
|---|---|
| `AGENTS.md` | What every new session needs: project, commands, rules, no-go zones, links to docs |
| `CLAUDE.md` | One line, `@AGENTS.md`, so Claude Code reads the same file |
| `_docs/process.md` | Tasks, roles, the orchestrator lifecycle, optional parallel worktrees |
| `_docs/task-template.md` | A groomed task: goal, acceptance criteria, out of scope, constraints |
| `_docs/testing-guidelines.md` | Starter testing rules - grow it as you correct the agent |
| `_docs/team/` | PM, software engineer, QA engineer roles |
| `.agents/agents/` | Subagent definitions that point at the roles |
| `.agents/skills/release` | Release a new version |
| `.agents/skills/build-fullstack` | Plan → mocked React frontend → OpenAPI → FastAPI → SQLAlchemy |
| `.agents/skills/ship-to-production` | Docker → Postgres/Compose → Playwright e2e → deploy (Render default) → CI/CD |
| `.claude/settings.json` | Starter allow-list / deny-list for Claude Code |
| `.github/ISSUE_TEMPLATE/task.md` | The task template as a GitHub issue form |
| `scripts/setup-claude.*` | Points Claude Code at `.agents/` (PowerShell for Windows, bash otherwise) |
| `prompts.md` | The prompt sequence, from vague idea to a backlog running in a loop |
| `coding-agents.md` | Free and cheap ways to get an agent |

## Setup

1. Copy everything into your repo (hidden folders included).
2. Fill in the `<...>` parts of `AGENTS.md`. Keep it short; link docs, don't paste them.
3. Using Claude Code? Run `scripts/setup-claude.ps1` (Windows) or `scripts/setup-claude.sh`.
   Claude doesn't read `.agents/`, so this links skills and copies subagents into `.claude/`.
4. Edit `.claude/settings.json` to match your real commands.
5. Start every task in a new session.

## Start in this order

1. **Pick an agent** and stop comparing. One finished task beats ten threads on which is best.
2. **One real, small task** you can check end to end. No MCP, skills or subagents yet.
3. **Automate through the CLI.** If a service has an API or CLI, the agent can drive it.
4. **Write down repeated work** as a markdown file the agent can follow next time.
5. **Promote useful docs to skills** once you keep coming back to them.
6. **Add subagents when context becomes the problem** - noisy or research-heavy work.

## Habits that matter more than any file

- **Reset the session often.** Long sessions rot; new sessions re-read `AGENTS.md`.
- **Spec before code.** Vague tasks get filled with the agent's assumptions.
- **Checkable stop conditions** for loops: "all tests pass", not "make it better".
- **Verify in a fresh session.** The implementer is biased by its own history.
- **Commit after every meaningful decision** so you can review and roll back.
- **Fix the documents, not just the code**, so the correction sticks.

## Permissions

Start with the allow-list in `.claude/settings.json` and add commands as you
approve them. Skip-permissions ("YOLO") mode is fine for an overnight loop in a
throwaway environment, never near production infrastructure, Terraform, cloud
IAM or billing. For infrastructure: the agent generates the plan, you review it,
you run the destructive command.

## Skills and subagents in one paragraph

A **skill** is a repeatable procedure (`.agents/skills/<name>/SKILL.md` with a
name and description); the agent picks it from your request. Don't write skills
from scratch: do the task with the agent, correct it, then use prompt 9 in
`prompts.md`. A **subagent** runs in its own clean context; the main session
only sees the result. When the main session launches PM → engineer → QA as
subagents, it becomes the orchestrator, and `/goal work through the backlog`
runs it until the backlog is empty. This costs far more tokens than one engineer
in a loop, so use it when the project earns it.
