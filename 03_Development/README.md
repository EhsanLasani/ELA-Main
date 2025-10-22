# 03 – Development

This phase contains the working source code, automation hooks, and AI prompts.  
Follow coding standards and governance defined in **`00_Policy/ELA_Development_Policy.docx`** and the repository guide.

## Structure
- **Source_Code/** — application modules with header blocks and docstrings.
- **AI_Prompts/** — approved prompt library, `context.yaml`, and prompt/completion logs.
- **tests/** — automated unit and integration test suites.
- **scripts/** — helper tooling (linting, formatting, header/license checks, codegen).
- **tools/hooks/** — optional shared commit hooks (pre-commit, commit-msg).
- **CHANGELOG.md** — consolidated from PR fragments; follows Conventional Commits.

## Standards & References
- **Policy:** `00_Policy/ELA_Development_Policy.docx`
- **Design Inputs:** `02_Design/` (incl. `Templates/AI_Context_Template.yaml`)
- **Integration Blueprint:** `04_Systems_Integration/Systems_Integration_Blueprint.md`
- **Repo Guide:** `00_Policy/Repository_Structure_Guide.md`

## Commit & Branching
- Branch format: `feature/<ticket-id>-<slug>` / `fix/<ticket-id>-<slug>`
- Commits follow **Conventional Commits** (feat, fix, chore, docs, refactor, test, build, ci).
- Every PR links to a change/ticket ID and updates relevant artifacts in `templates/catalog.csv`.

## Quality Gates
- Lint, type-check, and unit tests must pass locally and in CI.
- Add/maintain docstrings and header/license blocks in `Source_Code/`.
- For API or contract changes, update specs and consumers before merge.

## AI Prompts
- Place prompt assets in **AI_Prompts/**.
- **Context source:** derive from `02_Design/Templates/AI_Context_Template.yaml` (do not edit the template in place; copy into this folder and tailor).
- Keep prompt logs (inputs/outputs) for auditability; avoid sensitive data.

## CI/CD
- CI config is in `.github/workflows/` (pipeline validates lint, tests, and docs).
- Pre-commit hooks (optional): add hook scripts under `tools/hooks/` and install locally.
  ```bash
  # example
  cp tools/hooks/pre-commit .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
