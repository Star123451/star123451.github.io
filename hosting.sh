#!/bin/bash

set -e

REPO_URL="https://github.com/sinceohsix/peg86/archive/refs/heads/main.zip"
RELEASE_BASE="https://github.com/sinceohsix/peg86/releases/download/peg86"
INSTALL_DIR="$HOME/peg86"

REQUIRED_FILES=(
  "reactos.img"
  "state.bin"
)

# ─── Peggle Version Options ──────────────────────────────────────────────────
VERSION_LABELS=("Nights" "Extreme" "WoW Edition" "Pego (Prototype)")
VERSION_FILES=("nights.bin" "extreme.bin" "wow.bin" "proto.bin")

# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo "  peg86 selfhosted installer"
echo "────────────────────────────"
echo ""

# 1. Download and extract repo
echo "→ Downloading repository..."
TMP_ZIP=$(mktemp /tmp/peg86-XXXXXX.zip)
curl -fsSL "$REPO_URL" -o "$TMP_ZIP"

echo "→ Extracting to $INSTALL_DIR..."
rm -rf "$INSTALL_DIR"
TMP_DIR=$(mktemp -d)
unzip -q "$TMP_ZIP" -d "$TMP_DIR"
mv "$TMP_DIR"/peg86-main "$INSTALL_DIR"
rm -rf "$TMP_ZIP" "$TMP_DIR"

# 2. Swap index.html for local.html
echo "→ Swapping index files..."
rm -f "$INSTALL_DIR/index.html"
if [ -f "$INSTALL_DIR/local.html" ]; then
  mv "$INSTALL_DIR/local.html" "$INSTALL_DIR/index.html"
else
  echo "  ⚠ Warning: local.html not found — skipping rename"
fi

# 3. Download files
echo "→ Downloading required files..."
for FILE in "${REQUIRED_FILES[@]}"; do
  echo "  • $FILE"
  curl -fsSL "$RELEASE_BASE/$FILE" -o "$INSTALL_DIR/$FILE"
done

# 4. Ask which versions to install
echo ""
echo "Which versions would you like to install?"
echo "(Enter numbers separated by spaces, e.g. 1 3 — or press enter for all)"
echo ""
for i in "${!VERSION_LABELS[@]}"; do
  echo "  [$((i+1))] ${VERSION_LABELS[$i]}"
done
echo ""
read -rp "Your choice: " CHOICES

if [ -z "$CHOICES" ]; then
  CHOICES=$(seq 1 ${#VERSION_LABELS[@]} | tr '\n' ' ')
fi

echo ""
for CHOICE in $CHOICES; do
  INDEX=$((CHOICE-1))
  if [ "$INDEX" -lt 0 ] || [ "$INDEX" -ge "${#VERSION_LABELS[@]}" ]; then
    echo "  ⚠ Skipping invalid choice: $CHOICE"
    continue
  fi
  EDITION_LABEL="${VERSION_LABELS[$INDEX]}"
  EDITION_FILE="${VERSION_FILES[$INDEX]}"
  echo "→ Downloading $VERSION_LABEL ($EDITION_FILE)..."
  curl -fsSL "$RELEASE_BASE/$VERSION_FILE" -o "$INSTALL_DIR/$VERSION_FILE"
done

# 5. Launch
echo ""
echo "✓ Done! Starting peg86..."
echo ""
cd "$INSTALL_DIR"
npx serve