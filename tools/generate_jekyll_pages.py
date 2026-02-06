#!/usr/bin/env python3
"""Generate Jekyll wrapper pages for repo markdown.

This repo's content is mostly Markdown without YAML front matter.
Jekyll only renders Markdown files as pages when they have front matter.

This script generates lightweight wrapper pages under `_pages/` that:
- provide layout/title/permalink
- include the original Markdown using `{% include_relative %}`

The source docs remain untouched.
"""

from __future__ import annotations

import os
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PAGES_DIR = ROOT / "_pages"

EXCLUDE_DIRS = {
    ".git",
    ".github",
    "_pages",
    "_site",
    ".jekyll-cache",
    "vendor",
    ".bundle",
}

TOP_LEVEL_SLUGS = {
    "1 - Introduction to Escape-to-Host Flaws": "introduction",
    "2 - Kiosk Playbook": "kiosk-playbook",
    "3 - Presented App Playbook": "presented-app-playbook",
    "4 - Specific Escape Scenarios": "escape-scenarios",
    "5 - Defensive Recommendations": "defensive-recommendations",
}


_NUM_PREFIX_RE = re.compile(r"^\s*\d+\s*-\s*(.*)$")


def strip_numeric_prefix(s: str) -> str:
    m = _NUM_PREFIX_RE.match(s)
    return m.group(1) if m else s


def slugify(s: str) -> str:
    s = s.strip().lower()
    s = strip_numeric_prefix(s)
    s = re.sub(r"[^a-z0-9]+", "-", s)
    s = re.sub(r"-+", "-", s).strip("-")
    return s or "page"


def title_from_path(md_rel: Path) -> str:
    # Prefer the filename stem, but for README.md use the parent directory.
    if md_rel.name.lower() == "readme.md":
        if md_rel.parent == Path("."):
            return "About"
        return strip_numeric_prefix(md_rel.parent.name).strip()
    return strip_numeric_prefix(md_rel.stem).strip()


def permalink_for(md_rel: Path) -> str:
    parts = list(md_rel.parts)
    if parts and parts[0] in TOP_LEVEL_SLUGS:
        parts[0] = TOP_LEVEL_SLUGS[parts[0]]
    elif parts:
        parts[0] = slugify(parts[0])

    # Drop the filename for README.md (directory index).
    if md_rel.name.lower() == "readme.md":
        parts = parts[:-1]
    else:
        parts[-1] = slugify(md_rel.stem)

    # Slugify remaining directory parts.
    parts = [parts[0]] + [slugify(p) for p in parts[1:]]

    return "/" + "/".join(parts) + "/"


def iter_markdown_files() -> list[Path]:
    out: list[Path] = []
    for p in ROOT.rglob("*.md"):
        rel = p.relative_to(ROOT)
        if any(part in EXCLUDE_DIRS for part in rel.parts):
            continue
        if rel == Path("README.md"):
            continue
        if rel == Path("index.md"):
            continue
        out.append(rel)
    return sorted(out)


def write_wrapper(md_rel: Path) -> Path:
    permalink = permalink_for(md_rel)
    title = title_from_path(md_rel)

    out_dir = PAGES_DIR / permalink.strip("/")
    out_path = out_dir / "index.md"
    out_dir.mkdir(parents=True, exist_ok=True)

    # Path from the wrapper directory to the real markdown.
    include_path = os.path.relpath(ROOT / md_rel, out_dir)

    # Always quote include path (spaces are common in this repo).
    body = (
        "---\n"
        "layout: page\n"
        f'title: "{title}"\n'
        f"permalink: {permalink}\n"
        "---\n\n"
        f'{{% include_relative "{include_path}" %}}\n'
    )

    out_path.write_text(body, encoding="utf-8")
    return out_path


def main() -> int:
    PAGES_DIR.mkdir(exist_ok=True)
    generated = 0

    # Manual, friendly top-level entrypoints.
    manual = {
        "introduction": "1 - Introduction to Escape-to-Host Flaws/README.md",
        "kiosk-playbook": "2 - Kiosk Playbook/README.md",
        "presented-app-playbook": "3 - Presented App Playbook/README.md",
        "escape-scenarios": "4 - Specific Escape Scenarios/README.md",
        "defensive-recommendations": "5 - Defensive Recommendations/README.md",
        "about": "README.md",
    }
    for slug, src in manual.items():
        src_rel = Path(src)
        out_dir = PAGES_DIR / slug
        out_path = out_dir / "index.md"
        out_dir.mkdir(parents=True, exist_ok=True)

        include_path = os.path.relpath(ROOT / src_rel, out_dir)
        title = "About" if slug == "about" else slug.replace("-", " ").title()

        body = (
            "---\n"
            "layout: page\n"
            f'title: "{title}"\n'
            f"permalink: /{slug}/\n"
            "---\n\n"
            f'{{% include_relative "{include_path}" %}}\n'
        )
        out_path.write_text(body, encoding="utf-8")
        generated += 1

    for md_rel in iter_markdown_files():
        write_wrapper(md_rel)
        generated += 1

    print(f"Generated {generated} wrapper page(s) under {PAGES_DIR}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
