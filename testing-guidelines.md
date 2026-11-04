# Testing guidelines

<!-- Starter version. Grow it every time you correct the agent about tests. -->

- Every acceptance criterion gets at least one test that would fail without the change
- Test behaviour through public interfaces (HTTP endpoints, UI, CLI), not private helpers
- Backend: `<uv run pytest>`; frontend: `<npm --prefix frontend test>`; full stack: `<make e2e>`
- End-to-end tests run against `docker compose` and use Playwright
- A test that needs the network or a real database is an integration test: put it in `<tests/integration/>`
- Report the exact command you ran and its pass/fail counts
