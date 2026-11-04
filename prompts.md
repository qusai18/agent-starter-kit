# Prompts

In the order you use them. Start a new session for each step.

## 1. Scope the idea (chat assistant, before any code)

    I want to build <your idea>.

    Help me set the scope for this project precisely. I want to brainstorm with you
    and understand how the tool should work. Give me options.

    Ask me one question at a time and keep your output short.

When you're done:

    Save everything to a markdown file that I can download.

Save it as `_docs/plan.md` and commit.

## 2. Choose the stack

    Read _docs/plan.md. Propose multiple options for the tech stack and
    explain each option.

    Don't write code yet.

## 3. Create the backlog

    Create a backlog with tasks in _docs/tasks.md.

    Each task should be small enough to finish in one session, and
    independent enough that I could hand it to someone who has not read
    the others.

    Use this template for each task:

    ## <number>. <title>
    Goal: <one line>
    Description: <two or three sentences on what the task involves>

    The first task should be setting up an empty project with a passing test.

    Don't write code yet.

Review it: merge tasks that are too small, split ones that don't fit a session,
cut what isn't MVP. Then:

    Create a public GitHub repo for this project.
    Move each task from _docs/tasks.md into a GitHub issue.

(Needs `gh` authenticated.) From now on GitHub issues are the backlog.

## 4. Groom, implement, test (one role, one fresh session each)

    Groom issue #4
    Implement issue #4
    Test issue #4

On FAIL, start a new engineer session with the QA comment as input. Repeat
until PASS.

## 5. Run the backlog in a loop (Claude Code, Codex)

    /goal work through the backlog

Use a checkable stop condition: "all issues are groomed", "all tests pass",
"no file is over 200 lines". Not "make the code better". No `/goal` in your
agent? Build the same loop with stop hooks.

## 6. Launch a subagent

    Launch a subagent to implement #101. Follow the process.
    Launch software engineer for #101

The second uses `.agents/agents/`. Claude Code needs a restart to see new definitions.

## 7. Build and ship (uses the build-fullstack and ship-to-production skills)

    Build stage 1 of the app from _docs/plan.md
    Ship step 2: Postgres and Docker Compose

## 8. Update the documents after corrections

    Based on the corrections I made, find the relevant documents and update them.
    Commit the current work before changing the documents.

## 9. Save the session as a skill

    Save this as a skill. Cover the workflow we followed and keep all the
    corrections I made in mind, so the next agent can do the task correctly from
    the start.

    This skill is specific to this project, so don't create a global skill.

Keep the last line: without it, Codex creates a global skill.
