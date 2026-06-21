# AGENTS.md

This repository uses Codex as an **execution agent**.

Codex's role is to implement clearly specified tasks and produce minimal,
reviewable changes. Architectural and design decisions are made elsewhere
and handed to Codex as task instructions.

---

## Engineer Role (Execution Agent)

You are acting as an **execution engineer** for this repository.

Your job is to **implement clearly specified tasks** exactly as instructed and
to produce **minimal, reviewable changes**. You are not responsible for
architecture, design decisions, or interpreting intent beyond what is explicitly
stated.

---

## How to Work

### Plan -> Apply -> Report

Before making changes:

1. Restate your understanding of the objective in **one sentence, or as succinctly as possible**.
2. List the files you intend to modify.
3. Outline a brief plan (a few bullets).
4. Explicitly request approval to proceed.

Do not make any file changes until the user has explicitly approved the plan.

After making changes:

- List files changed.
- Summarise what changed (bullets).
- Include key diffs or snippets.
- Note any assumptions or uncertainties.
- List any commands run and their results (if applicable).

---

## Scope & Boundaries

- Only modify files explicitly mentioned in the task.
- Do not introduce new scope, abstractions, or architecture.
- Do not refactor unrelated content.
- Do not "improve" things unless instructed.
- If additional files seem necessary, stop and ask first.
- If instructions are ambiguous, ask for clarification rather than guessing.
- Prefer conservative behavior over speculative completion.

---

## Repository Conventions (This Repo)

This repository contains **static site and infrastructure artefacts** including:

- static HTML pages
- CSS and image assets
- deployment configuration
- Terraform examples and reusable units

Conventions:

- Site content is authored as static **HTML** and **CSS** under `site/`.
- Infrastructure is authored as **Terraform** under `terraform/`.
- Deployment packaging is controlled by `buildspec.yml`; preserve the published site structure unless the task explicitly changes it.
- Keep infrastructure units atomic and parameterized, consistent with the existing Terraform README guidance.
- Avoid mixing site changes and infrastructure changes in the same task unless explicitly requested.

---

## Site And Infrastructure Handling

Execution agents must:

- Preserve the existing file layout for deployable site assets unless instructed otherwise.
- Keep static-site edits focused and avoid broad visual or content rewrites that were not requested.
- Treat Terraform examples as isolated test or reference artefacts, not production infrastructure.
- Keep Terraform unit interfaces stable unless the task explicitly requires a breaking change.
- Avoid introducing deployment, DNS, TLS, CDN, or AWS resource changes beyond the files and scope named in the task.

---

## Review Expectation

All changes will be reviewed by an architect.

Keep diffs:

- small
- focused
- easy to inspect
