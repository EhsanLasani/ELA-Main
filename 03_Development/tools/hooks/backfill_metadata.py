#!/usr/bin/env python3
import csv, os, sys, pathlib, re

CATALOG = "templates/catalog.csv"
REPO = pathlib.Path(".").resolve()

MD_EXT = {".md",".markdown",".mdown",".mkd",".mkdn"}
YAML_EXT = {".yaml",".yml"}
TEXT_EXT = MD_EXT | YAML_EXT

def has_metadata_block(text:str)->bool:
    return bool(re.search(r'^\s*##\s*0\.\s*Metadata\s*$', text, flags=re.I|re.M))

def prepend_metadata_block(path: str, aid: str, version: str):
    p = pathlib.Path(path)
    content = p.read_text(encoding="utf-8", errors="ignore")
    if has_metadata_block(content):
        return False
    header = (
        "## 0. Metadata\n"
        f"- **Artifact ID (catalog.csv):** {aid}\n"
        f"- **Version:** {version}\n"
        f"- **Owner:** \n"
        f"- **Linked Ticket / PR:** \n\n"
    )
    p.write_text(header + content, encoding="utf-8")
    return True

def main():
    if not os.path.exists(CATALOG):
        print(f"ERROR: {CATALOG} not found", file=sys.stderr)
        sys.exit(1)

    with open(CATALOG, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))

    changed_files = 0
    for r in rows:
        rel = r.get("File_Path","").strip()
        if not rel:
            continue
        full = REPO / rel
        if not full.exists():
            print(f"[skip] missing file: {rel}")
            continue
        ext = full.suffix.lower()
        if ext not in TEXT_EXT:
            continue
        try:
            updated = prepend_metadata_block(str(full), r.get("ID","").strip(), r.get("Version","v1.0").strip() or "v1.0")
            if updated:
                changed_files += 1
                print(f"[meta] added Metadata block: {rel}")
        except Exception as e:
            print(f"[error] {rel}: {e}", file=sys.stderr)

    if changed_files:
        print(f"[done] metadata added to {changed_files} file(s)")
    else:
        print("[done] no files needed metadata")

if __name__ == "__main__":
    main()
