#!/bin/bash
#
# Marp slide HTML preview generation script
#
# Usage:
#   ./preview.sh <markdown_file> [theme_css]
#
# Examples:
#   ./preview.sh slides.md
#   ./preview.sh slides.md custom-theme.css

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <markdown_file> [theme_css]"
    exit 1
fi

MARKDOWN_FILE="$1"
THEME_CSS="${2:-}"

if [ ! -f "$MARKDOWN_FILE" ]; then
    echo "Error: File not found: $MARKDOWN_FILE"
    exit 1
fi

OUTPUT_FILE="${MARKDOWN_FILE%.md}.html"

if [ -n "$THEME_CSS" ]; then
    npx @marp-team/marp-cli@latest \
        "$MARKDOWN_FILE" \
        --output "$OUTPUT_FILE" \
        --theme-set "$THEME_CSS" \
        --html
else
    npx @marp-team/marp-cli@latest \
        "$MARKDOWN_FILE" \
        --output "$OUTPUT_FILE" \
        --html
fi

echo "Preview generated: $OUTPUT_FILE"

# Open in browser (OS detection)
if command -v xdg-open &> /dev/null; then
    xdg-open "$OUTPUT_FILE"
elif command -v open &> /dev/null; then
    open "$OUTPUT_FILE"
else
    echo "Please open $OUTPUT_FILE in your browser"
fi
