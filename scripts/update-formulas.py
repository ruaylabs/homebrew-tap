#!/usr/bin/env python3
"""Update Homebrew definitions to their latest stable releases."""

import hashlib
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

STABLE_VERSION = re.compile(
    r"^v?(?P<version>(?:0|[1-9]\d*)\."
    r"(?:0|[1-9]\d*)\."
    r"(?:0|[1-9]\d*)(?:\+[0-9A-Za-z.-]+)?)$"
)
VERSION = re.compile(r'^\s*version\s+"(?P<version>[^"]+)"', re.MULTILINE)
HOMEPAGE = re.compile(
    r'^\s*homepage\s+"https://github\.com/(?P<repo>[^/\"]+/[^/\"]+?)(?:\.git)?"',
    re.MULTILINE,
)
URL = re.compile(r'^\s*url\s+"(?P<url>[^"]+)"', re.MULTILINE)
SHA256 = re.compile(r'sha256(?:\s+(?P<arch>arm|intel):)?\s+"(?P<digest>[0-9a-f]{64})"')
ARCH_LINE = re.compile(r"^\s*arch\s+(?P<values>.+)$", re.MULTILINE)
ARCH_VALUE = re.compile(r'\b(?P<name>arm|intel):\s*"(?P<value>[^"]+)"')


def latest_stable_version(repo: str) -> str:
    tag = subprocess.check_output(
        [
            "gh", "release", "list", "--repo", repo,
            "--exclude-drafts", "--exclude-pre-releases", "--limit", "1",
            "--json", "tagName", "--jq", ".[0].tagName",
        ],
        text=True,
    ).strip()
    match = STABLE_VERSION.fullmatch(tag)
    if not match:
        raise ValueError(f"{repo}: no stable semantic release found")
    return match["version"]


def render_url(template: str, version: str, arch: str | None) -> str:
    rendered = template.replace("#{version}", version)
    if "#{arch}" in rendered:
        if arch is None:
            raise ValueError("URL uses #{arch}, but its sha256 has no architecture qualifier")
        rendered = rendered.replace("#{arch}", arch)
    if "#{" in rendered:
        raise ValueError(f"unsupported URL interpolation in {template!r}")
    return rendered


def checksum_for_url(url: str) -> str:
    request = urllib.request.Request(url, headers={"User-Agent": "homebrew-tap-release-updater"})
    checksum = hashlib.sha256()
    with urllib.request.urlopen(request, timeout=120) as response:
        while chunk := response.read(1024 * 1024):
            checksum.update(chunk)
    return checksum.hexdigest()


def update_definition(path: Path) -> bool:
    source = path.read_text()
    homepage_match = HOMEPAGE.search(source)
    version_match = VERSION.search(source)
    url_match = URL.search(source)
    if not homepage_match or not version_match or not url_match:
        raise ValueError(f"{path}: expected GitHub homepage, version, and URL stanzas")

    latest_version = latest_stable_version(homepage_match["repo"])

    current_version = version_match["version"]
    if not STABLE_VERSION.fullmatch(current_version):
        raise ValueError(f"{path}: version {current_version!r} is not semantic")
    sha_matches = list(SHA256.finditer(source))
    if not sha_matches:
        raise ValueError(f"{path}: no sha256 stanza found")

    url_line = source.count("\n", 0, url_match.start())
    distances = [(abs(source.count("\n", 0, match.start()) - url_line), match) for match in sha_matches]
    nearest = min(distance for distance, _ in distances)
    primary_hashes = [match for distance, match in distances if distance <= nearest + 2]
    arch_values = {
        match["name"]: match["value"]
        for line in ARCH_LINE.finditer(source)
        for match in ARCH_VALUE.finditer(line["values"])
    }

    replacements: list[tuple[int, int, str]] = []
    if current_version != latest_version:
        replacements.append(
            (version_match.start("version"), version_match.end("version"), latest_version)
        )

    for sha_match in primary_hashes:
        arch_name = sha_match["arch"]
        arch_value = arch_values.get(arch_name) if arch_name else None
        rendered_url = render_url(url_match["url"], latest_version, arch_value)
        digest = checksum_for_url(rendered_url)
        if digest != sha_match["digest"]:
            replacements.append((sha_match.start("digest"), sha_match.end("digest"), digest))

    if not replacements:
        print(f"{path}: release is current")
        return False

    updated = source
    for start, end, replacement in sorted(replacements, reverse=True):
        updated = updated[:start] + replacement + updated[end:]
    path.write_text(updated)
    print(f"{path}: {current_version} -> {latest_version}")
    return True


def definition_paths(arguments: list[str]) -> list[Path]:
    if arguments:
        return [Path(argument) for argument in arguments]
    return sorted(Path("Casks").glob("*.rb")) + sorted(Path("Formula").glob("*.rb"))


def main() -> int:
    paths = definition_paths(sys.argv[1:])
    if not paths:
        print("No formula or cask files found.")
        return 0

    updated = sum(update_definition(path) for path in paths)
    print(f"Updated {updated} definition(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
