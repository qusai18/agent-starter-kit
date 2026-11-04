---
name: build-fullstack
description: Build a full-stack web app from _docs/plan.md in stages - mocked frontend, OpenAPI contract, FastAPI backend, then a database
---

# Build a full-stack app

Each stage ends with something that runs. Finish and commit a stage before
starting the next, and start each stage in a fresh session.

Target layout:

    backend/      FastAPI app and its tests
    frontend/     React app (TypeScript)
    _docs/        plan.md and the other project documents
    AGENTS.md
    openapi.yaml  the frontend-backend contract

## 1. Frontend with a mocked backend

Build the React app from `_docs/plan.md`. Centralize every backend call in one
services layer, and create a mock implementation of it so the whole app runs
without a real backend. Add tests.

Done when: `npm run dev` in `frontend/` shows the app and every screen in the
plan can be clicked through against the mock.

## 2. OpenAPI contract

Read the frontend's services layer and write `openapi.yaml` at the repo root:
every endpoint, method, path, request body, response body, and which endpoints
need authentication.

Done when: every function in the services layer maps to an operation in
`openapi.yaml`.

## 3. Backend with an in-memory store

Build a FastAPI backend in `backend/` that implements `openapi.yaml`. Use an
in-memory store seeded with sample data. Hashed passwords and bearer tokens for
authenticated endpoints. Split into modules: routers, models, store, auth.
Write tests. Add a Makefile with `make run`.

Then switch the frontend to the real backend client and fix CORS.

Done when: backend tests pass, `/docs` matches `openapi.yaml`, and the frontend
works end to end against the running backend.

## 4. Persistence

Replace the in-memory store with SQLAlchemy on SQLite. The database URL comes
from an environment variable. Stay database-agnostic (no SQLite-only features)
so Postgres can be swapped in later.

Done when: data survives a backend restart and all tests pass.
