## Metadata
---
Artifact_ID: TMP-00-Coding_Standards_Tem
Artifact_Name: Coding Standards (Template)
Artifact_Type: TMP
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: Coding Standards (Template)
File_Path: 00_Policy/Templates/03_Development/Coding_Standards_Template.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Templates/03_Development/Coding_Standards_Template.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: ELA-Template
Validation_Status: Pending
Version: v1.0
---
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
