#!/usr/bin/env python3
import csv, os, sys, re, datetime, pathlib

CATALOG = "templates/catalog.csv"
REPO = pathlib.Path(".").resolve()

# phase detection based on top-level folder
PHASE_MAP = {
    "00_Policy": "Policy",
    "01_Definition": "Definition",
    "02_Design": "Design",
    "03_Development": "Development",
    "04_Systems_Integration": "Integration",
    "05_Validation_Testing": "Validation",
    "07_Monitoring_Control": "Monitoring",
}

CONTROLLED_GLOBS = [
    "00_Policy/**/*.md",
    "01_Definition/**/*.[ym]ml",
    "01_Definition/**/*.md",
    "02_Design/**/*.[ym]ml",
    "02_Design/**/*.md",
    "03_Development/Templates/**/*.[ym]ml",
    "03_Development/Templates/**/*.md",
    "04_Systems_Integration/**/*.[ym]ml",
    "04_Systems_Integration/**/*.md",
    "05_Validation_Testing/**/*.[ym]ml",
    "05_Validation_Testing/**/*.md",
    "07_Monitoring_Control/**/*.[ym]ml",
    "07_Monitoring_Control/**/*.md",
]

REQ_COLS = ["ID","Artifact_Name","File_Path","Phase","Version","Status","Owner","Last_Updated","GitHub_URL","Linked_PR","Remarks"]

def load_catalog():
    rows = []
    if os.path.exists(CATALOG):
        with open(CATALOG, newline="", encoding="utf-8") as f:
            r = csv.DictReader(f)
            for row in r:
                rows.append({k: row.get(k,"").strip() for k in REQ_COLS})
    return rows

def save_catalog(rows):
    os.makedirs(os.path.dirname(CATALOG), exist_ok=True)
    with open(CATALOG, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=REQ_COLS)
        w.writeheader()
        for r in rows:
            w.writerow(r)

def infer_phase(rel_path:str)->str:
    top = rel_path.split("/", 1)[0]
    return PHASE_MAP.get(top, "")

def make_id(rel_path:str)->str:
    # Example ID: DOC-DEV-DEP-001 (stable-ish but simple)
    base = pathlib.Path(rel_path).stem.upper()
    base = re.sub(r"[^A-Z0-9]+","-", base)[:12].strip("-")
    phase = infer_phase(rel_path)[:3].upper() if infer_phase(rel_path) else "GEN"
    prefix = "DOC" if "/Templates/" not in rel_path else "TMP"
    return f"{prefix}-{phase}-{base}"

def artifact_name(rel_path:str)->str:
    return pathlib.Path(rel_path).name.replace("_"," ").replace("-"," ")

def blob_url(rel_path:str)->str:
    return f"https://github.com/<org>/<repo>/blob/main/{rel_path}"

def main():
    rows = load_catalog()
    existing_by_path = {r["File_Path"]: r for r in rows}
    existing_ids = {r["ID"] for r in rows}

    # collect files
    import glob
    files = set()
    for pat in CONTROLLED_GLOBS:
        files.update(glob.glob(pat, recursive=True))

    # skip binaries by extension
    SKIP_EXT = {".docx",".doc",".xlsx",".xls",".pdf",".png",".jpg",".jpeg",".gif",".svg"}
    files = [f.replace("\\","/") for f in files if os.path.splitext(f)[1].lower() not in SKIP_EXT]

    today = datetime.datetime.utcnow().strftime("%Y-%m-%d")
    changed = False

    for path in sorted(files):
        if path in existing_by_path:
            continue
        phase = infer_phase(path)
        aid = make_id(path)
        # avoid accidental ID collision
        suffix = 1
        base_id = aid
        while aid in existing_ids:
            suffix += 1
            aid = f"{base_id}-{suffix:02d}"
        existing_ids.add(aid)

        row = {
            "ID": aid,
            "Artifact_Name": artifact_name(path),
            "File_Path": path,
            "Phase": phase,
            "Version": "v1.0",
            "Status": "Draft",
            "Owner": "",
            "Last_Updated": today,
            "GitHub_URL": blob_url(path),
            "Linked_PR": "",
            "Remarks": "",
        }
        rows.append(row)
        changed = True
        print(f"[catalog] added: {aid} -> {path}")

    if changed or not os.path.exists(CATALOG):
        save_catalog(rows)
        print(f"[catalog] saved {CATALOG} with {len(rows)} rows")
    else:
        print("[catalog] no changes needed")

if __name__ == "__main__":
    main()
