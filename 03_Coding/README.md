# 03 - Coding

Maintain the working source code, automation hooks, and AI prompts. Follow the coding standards defined in `docs/policy/ELA_Development_Policy.md`.

## Structure
- `Source_Code/` - application modules with header blocks and docstrings.
- `AI_Prompts/` - approved prompt library, `context.yaml`, and prompt/completion logs.
- `tests/` - automated unit and integration suites.
- `scripts/` - helper tooling (linting, formatting, header checks).
- `CHANGELOG.md` - fragment entries merged during pull requests.

## Templates & Reuse
- Shared commit hooks: `../shared-libs/hooks/`
- CI/CD sample: `../ci-cd-pipeline/sample-pipeline.yml`
- Prompt guidance: `../templates/documentation/Execution/AI_Context/context.yaml`

## Tips
- Install pre-commit hooks from `../shared-libs/hooks/` to enforce headers and formatting.
- Run linting/tests locally before opening a PR; CI must stay green.
- Link every branch/commit to a change request ID using the agreed naming convention.
