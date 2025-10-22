#!/usr/bin/env python3
import csv, os, sys, subprocess, re, datetime, pathlib

CATALOG = "templates/catalog.csv"
REQ_COLS = ["ID","Artifact_Name","File_Path","Phase","Version","Status","Owner","Last_Updated","GitHub_URL","Linked_PR","Remarks"]

def detect_repo_slug() -> str:
    """Return 'owner/repo' based on `git remote get-url origin`."""
    try:
        url = subprocess.check_output(["git","config","--get","remote.origin.url"], text=True).strip()
    except Exception:
        return ""
    # https://github.com/owner/repo(.git)?
    m = re.match(r"^https://github\.com/([^/]+/[^/]+?)(?:\.git)?$", url, re.I)
    if m: return m.group(1)
    # git@github.com:owner/repo(.git)?
    m = re.match(r"^git@github\.com:([^/]+/[^/]+?)(?:\.git)?$", url, re.I)
    if m: return m.group(1)
    return ""

def is_blank_row(row: dict) -> bool:
    # Consider a row blank if all required columns are empty or missing
    return all(not (row.get(c) or "").strip() for c in REQ_COLS)

def main():
    if not os.path.exists(CATALOG):
        print(f"{CATALOG} not found.")
        sys.exit(1)

    with open(CATALOG, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        header = reader.fieldnames or []
        if header != REQ_COLS:
            print("Normalizing header…")
            rows_raw = list(reader)
        else:
            rows_raw = list(reader)

    # Filter out blank/None-key rows
    rows = []
    for r in rows_raw:
        # Some CSVs produce {None: [',,,,']} for blank lines; drop them
        if None in r and not any((r.get(k) or "").strip() for k in REQ_COLS):
            continue
        # Normalize to required columns
        nr = {k: (r.get(k,"") or "").strip() for k in REQ_COLS}
        if is_blank_row(nr):  # drop empty
            continue
        rows.append(nr)

    # Fill GitHub_URL from repo slug if missing or placeholder-like
    slug = detect_repo_slug()
    if not slug:
        print("Warning: could not detect repo slug from git remote. Fill URLs later if needed.")
    else:
        for r in rows:
            fp = r["File_Path"].strip().lstrip("./")
            url = r["GitHub_URL"].strip()
            if ("<org>/<repo>" in url) or (not url and fp):
                r["GitHub_URL"] = f"https://github.com/{slug}/blob/main/{fp}"

    # Update Last_Updated for housekeeping
    today = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d")
    for r in rows:
        if not r["Last_Updated"]:
            r["Last_Updated"] = today

    # De-duplicate by ID (keep last occurrence)
    dedup = {}
    for r in rows:
        dedup[r["ID"]] = r
    rows = list(dedup.values())

    # Write back clean file
    os.makedirs(os.path.dirname(CATALOG), exist_ok=True)
    with open(CATALOG, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=REQ_COLS)
        w.writeheader()
        w.writerows(rows)

    print(f"Cleaned catalog: {len(rows)} rows, repo={slug or 'unknown'}")

if __name__ == "__main__":
    main()
