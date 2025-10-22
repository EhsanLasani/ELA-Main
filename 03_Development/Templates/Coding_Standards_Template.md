## 0. Metadata
- **Artifact ID (catalog.csv):** TMP-DEV-CODING-STAND
- **Version:** v1.0
- **Owner:** 
- **Linked Ticket / PR:** 

<!-- 03_Development/Templates/Coding_Standards_Template.md -->
# Coding Standards (Template)

**Artifact ID (catalog.csv):** TMP-CODESTD  
**Version:** v1.0  
**Owner:**  
**Linked Ticket / PR:**  

This template defines baseline coding standards for ELA projects. Extend with language-specific addendums as needed.

---

## 1. General Principles
- Prefer **clarity over cleverness**; readability first.
- Keep functions and modules **small and cohesive** (single responsibility).
- **Fail fast** on invalid states; validate inputs near boundaries.
- Write **tests alongside code**; keep coverage meaningful (target ≥ 80%).
- No secrets or credentials in code, logs, or history.
- Everything **linted, formatted, and typed** (where applicable) before PR.

---

## 2. Source Layout & Naming
- Use a clear `Source_Code/` structure mirroring domains or features.
- Filenames, packages, and namespaces: **lowercase-with-dashes** or **snake_case** (follow language norms).
- Public APIs are **intentional**; avoid needless exports; prefer module-private helpers.

---

## 3. Documentation & Headers
- Every file includes a **header** with: module name, brief description, author/team, license notice (if required).
- Every public class/function includes a **docstring** describing purpose, inputs, outputs, and edge cases.
- Maintain `README.md` at the module or root describing build, run, and test instructions.

---

## 4. Testing Standards
- Co-locate tests under `tests/` mirroring the source layout.
- Write **unit tests** for pure logic; **integration tests** for IO and cross-service flows.
- Use **fixtures/fakes** for external dependencies; avoid live integration in CI unless gated.
- Define **coverage thresholds** (example: 80%) and **must-not-fail** test jobs in CI.
- For bugs, add a **regression test** reproducing the issue before fixing.

---

## 5. Linting, Formatting, and Types
- Enforce a single formatter (e.g., **Prettier**, **Black**, **gofmt**, **clang-format**).
- Lint with tools appropriate to the language (e.g., **ESLint**, **Ruff**, **Pylint**, **Checkstyle**).
- Type-check when supported (e.g., **TypeScript**, **mypy**, **Go**’s static typing).
- Configure tools in repo-tracked config files and run them in CI.

**Example JS/TS:**
```json
// package.json (excerpt)
{
  "scripts": {
    "format": "prettier -w .",
    "lint": "eslint .",
    "typecheck": "tsc -p tsconfig.json",
    "test": "vitest run"
  }
}
