#!/bin/bash
#
# Marp theme build script
#
# Runs SCSS→CSS compile and sample image generation
#
# Usage:
#   ./build.sh [--watch]
#
# Options:
#   --watch  Watch for file changes and auto-rebuild

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="${SCRIPT_DIR}/.."

# Default paths (relative to project root)
SCSS_PATH="${SCSS_PATH:-marp-themes/theme.scss}"
CSS_PATH="${CSS_PATH:-marp-themes/theme.css}"
SRC_PATH="${SRC_PATH:-example/example.md}"
DST_PATH="${DST_PATH:-example/example.png}"

cd "$PROJECT_DIR"

# Command existence check
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: $1 is not installed"
        echo "Install: $2"
        exit 1
    fi
}

check_command "sass" "npm install -g sass"
check_command "npx" "Install Node.js"

# SCSS compile
compile_scss() {
    echo "Compiling SCSS: $SCSS_PATH -> $CSS_PATH"
    sass "$SCSS_PATH" "$CSS_PATH"
    echo "Done"
}

# Sample image generation
generate_images() {
    echo "Generating sample images: $SRC_PATH -> $DST_PATH"
    npx @marp-team/marp-cli@latest \
        "$SRC_PATH" \
        --output "$DST_PATH" \
        --theme-set "$CSS_PATH" \
        --images png
    echo "Done"
}

# Watch mode
watch_mode() {
    echo "Starting watch mode (Ctrl+C to exit)"
    echo ""

    # Watch SCSS in background
    sass --watch "$SCSS_PATH" "$CSS_PATH" &
    SASS_PID=$!

    # Watch Marp
    npx @marp-team/marp-cli@latest \
        "$SRC_PATH" \
        --watch \
        --output "$DST_PATH" \
        --theme-set "$CSS_PATH" \
        --images png &
    MARP_PID=$!

    # Trap exit signal
    trap "kill $SASS_PID $MARP_PID 2>/dev/null; exit" INT TERM

    # Wait
    wait
}

# Main
main() {
    if [ "${1:-}" = "--watch" ]; then
        watch_mode
    else
        compile_scss
        echo ""
        generate_images
        echo ""
        echo "Build complete"
        echo "Generated files:"
        ls -la "$CSS_PATH" 2>/dev/null || true
        ls -la "${DST_PATH%.png}".*.png 2>/dev/null || true
    fi
}

main "$@"
