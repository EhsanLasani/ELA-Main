
# CODING STANDARDS TEMPLATE

---
```yaml
Artifact_ID: TMP-00-Coding_Standards_Tem
Artifact_Name: CODING STANDARDS TEMPLATE
Artifact_Type: TMP
Version: v1.0
Status: Draft
Owner: Enterprise Architecture Office (EAO)
Last_Updated: 2025-10-25
Description: Template for coding standards in ELA projects
File_Path: 00_Policy/Templates/03_Development/Coding_Standards_Template.md
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Coding_Standards_Template.md
Phase: Development
Dependencies: None
Process_Group: Development
Process_Step: N/A
Template_Source: ELA-Template
Validation_Status: Pending
Comments: Auto-generated on 2025-10-25
```

| **Field**           | **Value**                                                                 |
|---------------------|---------------------------------------------------------------------------|
| Artifact ID         | TMP-00-Coding_Standards_Tem                                               |
| Artifact Name       | CODING STANDARDS TEMPLATE                                                 |
| Artifact Type       | TMP                                                                       |
| Version             | v1.0                                                                      |
| Status              | Draft                                                                     |
| Owner               | Enterprise Architecture Office (EAO)                                      |
| Last Updated        | 2025-10-25                                                                |
| Description         | Template for coding standards in ELA projects                             |
| File Path           | 00_Policy/Templates/03_Development/Coding_Standards_Template.md           |
| GitHub URL          | https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Coding_Standards_Template.md |
| Phase               | Development                                                               |
| Dependencies        | None                                                                      |
| Process Group       | Development                                                               |
| Process Step        | N/A                                                                       |
| Template Source     | ELA-Template                                                              |
| Validation Status   | Pending                                                                   |
| Comments            | Auto-generated on 2025-10-25                                              |

---

## How to Use This Template
- Use this template to define baseline coding standards for your ELA project.
- Extend with language-specific addendums as needed.
- Reference related architecture, design, and testing documentation as appropriate.

---

## Source Layout & Naming
- Use a clear `Source_Code/` structure mirroring domains or features.
- Filenames, packages, and namespaces: **lowercase-with-dashes** or **snake_case** (follow language norms).
- Public APIs are **intentional**; avoid needless exports; prefer module-private helpers.

## Testing Standards
- Co-locate tests under `tests/` mirroring the source layout.
- Write **unit tests** for pure logic; **integration tests** for IO and cross-service flows.
- Use **fixtures/fakes** for external dependencies; avoid live integration in CI unless gated.
- Define **coverage thresholds** (example: 80%) and **must-not-fail** test jobs in CI.
- For bugs, add a **regression test** reproducing the issue before fixing.

## Linting, Formatting, and Types
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
```

---

## Revision History
| Version | Date       | Author                  | Changes         |
|---------|------------|-------------------------|-----------------|
| 1.0.0   | 2025-10-25 | Enterprise Architecture | Initial template|

## 2. Source Layout & Naming
- Use a clear `Source_Code/` structure mirroring domains or features.
- Filenames, packages, and namespaces: **lowercase-with-dashes** or **snake_case** (follow language norms).
- Public APIs are **intentional**; avoid needless exports; prefer module-private helpers.

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
