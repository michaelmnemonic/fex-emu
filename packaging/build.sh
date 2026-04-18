#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

PACKAGE="fex-emu"
VERSION="$(dpkg-parsechangelog -l "${SCRIPT_DIR}/debian/changelog" -S Version | cut -d- -f1)"

ORIG_TARBALL="${PACKAGE}_${VERSION}.orig.tar.gz"
SOURCE_DIR="${PACKAGE}-${VERSION}"

BUILD_DIR="${PROJECT_DIR}/build-area"

# ── Prepare build directory ──────────────────────────────────────────
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/${SOURCE_DIR}"

# ── Extract source (strip top-level dir from tarball) ────────────────
echo "==> Extracting source..."
tar xzf "${PROJECT_DIR}/${ORIG_TARBALL}" -C "${BUILD_DIR}/${SOURCE_DIR}" --strip-components=1

# ── Install debian/ directory into source tree ───────────────────────
echo "==> Installing packaging files..."
cp -a "${SCRIPT_DIR}/debian" "${BUILD_DIR}/${SOURCE_DIR}/debian"

# ── Build ────────────────────────────────────────────────────────────
echo "==> Building package..."
cd "${BUILD_DIR}/${SOURCE_DIR}"
dpkg-buildpackage -us -uc -b

echo ""
echo "==> Build complete. Artifacts in ${BUILD_DIR}/:"
ls -lh "${BUILD_DIR}"/*.deb 2>/dev/null || true
