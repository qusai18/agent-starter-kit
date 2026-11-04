# AGENTS.md

<!-- Template. Replace the <...> parts and delete what you don't need.
     Keep it short: link documents instead of copying them in. -->

# Project

<What the project does, in one or two sentences.>

Where things live:

- `<frontend/>`: <the React app>
- `<backend/>`: <the API and its tests>
- `<e2e/>`: <end-to-end tests>
- `_docs/`: plan, process, roles and guidelines

# Commands

- `<uv sync>`: install backend dependencies
- `<uv run pytest>`: the whole backend suite
- `<uv run pytest tests/test_home.py>`: one test file
- `<npm --prefix frontend run dev>`: run the frontend
- `<make run>` / `<make e2e>`: run the app / the end-to-end tests

# Rules

- Add dependencies in `<pyproject.toml>` / `<frontend/package.json>`, and ask first
- Commit after every meaningful change
- <Conventions to follow>

# Do not touch

- <Files and folders the agent must not change, e.g. .env, deploy secrets>
- Ask before destructive commands: `rm -rf`, force push, dropping a database,
  `terraform apply`, deleting cloud resources

# Documents

- `_docs/plan.md` - what we're building and why
- `_docs/process.md` - how work is organized (tasks, roles, orchestrator)
- `_docs/task-template.md` - the template for a groomed task
- Before writing tests, read `_docs/testing-guidelines.md`
- For anything touching the UI, read `<_docs/design-system.md>`
