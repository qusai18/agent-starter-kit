---
name: ship-to-production
description: Take a locally working full-stack app to production - one Docker image, Postgres, Docker Compose, e2e tests, deploy, CI/CD
---

# Ship to production

Starting point: the app runs locally with SQLAlchemy (see the build-fullstack
skill). Do one step per session and commit after each.

## 1. One container

Write a two-stage Dockerfile: Node builds the frontend, then a Python image
holds the backend plus the built static files. The backend serves the frontend.

Done when: `docker run` serves the whole app on one port and the smoke test
below passes.

## 2. Postgres and Docker Compose

Add Postgres support to the backend. Then write `docker-compose.yaml` with two
services, Postgres and the app, with a health check so the app waits for the
database. Add database migrations (Alembic).

Done when: `docker compose up --build` runs the app on Postgres and data
survives `docker compose down` / `up`.

## 3. Integration and end-to-end tests

Integration tests run against the Compose stack. Add a Playwright test in
`e2e/` that performs the smoke test below. Add `make e2e`.

Done when: `make e2e` passes on a clean checkout.

## 4. Deploy

Default target: Render (web service from the Dockerfile + managed Postgres,
described in `render.yaml`). If the project uses AWS instead, use
CloudFormation and a temporary admin user, and watch every step.

- Generate the plan or blueprint, show it, and wait for approval before
  creating or deleting cloud resources
- Secrets go in the platform's environment settings, never in the repo

Done when: the public URL passes the smoke test and the health endpoint
returns 200.

## 5. CI/CD

GitHub Actions on every push to main:

- backend and frontend tests in parallel
- build the Compose stack, run integration and e2e tests
- deploy only if everything passed (Render deploy hook, or an AWS OIDC role)
- check the health endpoint after the deploy

Done when: a trivial change pushed to main shows up on the public URL.

## Smoke test

<Write the one user journey that proves the app works, e.g. "create a session
in window 1, join from window 2, change something in window 2, see it in
window 1".>
