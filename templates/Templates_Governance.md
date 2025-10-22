# Templates & Catalog Governance

The **catalog** is the single source of truth for all controlled artifacts in this repository (policies, templates, project docs, blueprints, etc.).  
File: `templates/catalog.csv`

---

## 1. Purpose
- **Inventory:** every controlled artifact is listed exactly once.
- **Traceability:** each artifact has a path, owner, status, and links to PRs/tags.
- **Automation:** CI updates metadata on merges; Teams can be notified.
- **Audit:** PMO/compliance can export the catalog to BI/Excel.

---

## 2. Required Columns (schema)
`ID,Artifact_Name,File_Path,Phase,Version,Status,Owner,Last_Updated,GitHub_URL,Linked_PR,Remarks`

- **ID**: short stable key (e.g., `DOC-PP`, `TMP-REQ`, `DOC-004`)
- **Artifact_Name**: human-friendly title
- **File_Path**: repo-relative path (e.g., `01_Definition/Project_Plan.md`)
- **Phase**: one of `Policy|Definition|Design|Development|Integration|Validation|Monitoring`
- **Version**: `vMAJOR.MINOR` (e.g., `v1.0`)
- **Status**: `Draft|Under Review|Approved|Baseline|Archived`
- **Owner**: role or person accountable
- **Last_Updated**: `YYYY-MM-DD` (UTC)
- **GitHub_URL**: canonical blob URL for the file in `main`
- **Linked_PR**: e.g., `PR#42`
- **Remarks**: free text

> Keep column order and header spelling exactly as above.

---

## 3. Update Rules
- **Single Source:** Only this one file exists at `/templates/catalog.csv`.
- **When you add/move/rename a controlled file**, update or add its row.
- **On PR merge**, the Action:
  - updates `Last_Updated` and `Linked_PR` for artifacts whose `File_Path` changed in the PR;
  - if the PR title contains a version token like `v1.2`, it sets `Version` to that value for matching rows.
- **Baselines:** When you tag a baseline (e.g., `definition-baseline-v1.0`), the catalog state is considered locked for that baseline.
- **Archival:** Decommissioned artifacts change `Status` to `Archived` and keep their final `Version`.

---

## 4. Commit Message & PR Title Conventions
- Use **Conventional Commits** (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`…).
- To **bump version in catalog**, include `vMAJOR.MINOR` in the **PR title**:
  - Example: `docs(definition): Project_Plan.md → v1.1`
- The workflow reads the PR title and sets `Version` accordingly for touched artifacts.

---

## 5. Teams Notifications (optional)
- Create a Teams **Incoming Webhook** in your target channel.
- Add repo secret **`TEAMS_WEBHOOK_URL`** with that URL.
- On merged PRs that touch catalog entries, the Action posts a short message.

---

## 6. Quality Gates for Catalog Changes
- Every controlled file must have **exactly one** catalog row.
- `File_Path` must point to the real file in the repo.
- `Phase` must match the owning lifecycle folder.
- Keep IDs stable across renames (update only `File_Path` and `GitHub_URL`).

---

## 7. Examples

**Template entry**
