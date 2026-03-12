#!/bin/bash
# Marp Export Script
# Unified export script - easy export to multiple formats

set -e

# Default settings
SCALE=1
THEME=""
THEME_SET=""
ALLOW_LOCAL=false
OUTPUT_DIR=""
FORMATS=()

# Help
show_help() {
    cat << EOF
Usage: $(basename "$0") <input.md> [options]

Export Marp slides to various formats.

Options:
  -f, --format FORMAT   Output format (pdf, png, pptx, html)
                        Multiple: -f pdf -f png
  --all                 Output all formats (pdf, png, pptx, html)
  -o, --output DIR      Output directory (default: same as input file)
  --theme FILE          Custom theme CSS
  --theme-set DIR       Theme directory
  --scale N             PNG scale (default: 1)
  --allow-local-files   Allow local file access
  -h, --help            Show this help

Examples:
  # PDF output
  $(basename "$0") slide.md -f pdf

  # High-resolution PNG
  $(basename "$0") slide.md -f png --scale 2

  # All formats
  $(basename "$0") slide.md --all

  # PDF with custom theme
  $(basename "$0") slide.md -f pdf --theme ./theme.css --allow-local-files

  # Specify output directory
  $(basename "$0") slide.md --all -o ./output/
EOF
}

# Argument parsing
INPUT_FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--format)
            FORMATS+=("$2")
            shift 2
            ;;
        --all)
            FORMATS=("pdf" "png" "pptx" "html")
            shift
            ;;
        -o|--output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --theme)
            THEME="$2"
            shift 2
            ;;
        --theme-set)
            THEME_SET="$2"
            shift 2
            ;;
        --scale)
            SCALE="$2"
            shift 2
            ;;
        --allow-local-files)
            ALLOW_LOCAL=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            show_help
            exit 1
            ;;
        *)
            if [[ -z "$INPUT_FILE" ]]; then
                INPUT_FILE="$1"
            else
                echo "Error: Multiple input files not supported" >&2
                exit 1
            fi
            shift
            ;;
    esac
done

# Input file verification
if [[ -z "$INPUT_FILE" ]]; then
    echo "Error: Input file required" >&2
    show_help
    exit 1
fi

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File not found: $INPUT_FILE" >&2
    exit 1
fi

# Default to PDF if no format specified
if [[ ${#FORMATS[@]} -eq 0 ]]; then
    FORMATS=("pdf")
fi

# Output directory setup
if [[ -z "$OUTPUT_DIR" ]]; then
    OUTPUT_DIR=$(dirname "$INPUT_FILE")
fi
mkdir -p "$OUTPUT_DIR"

# Get base filename
BASENAME=$(basename "$INPUT_FILE" .md)

# Build common options
COMMON_OPTS=()
if [[ -n "$THEME" ]]; then
    COMMON_OPTS+=("--theme" "$THEME")
fi
if [[ -n "$THEME_SET" ]]; then
    COMMON_OPTS+=("--theme-set" "$THEME_SET")
fi
if [[ "$ALLOW_LOCAL" == "true" ]]; then
    COMMON_OPTS+=("--allow-local-files")
fi

# Verify marp command
if ! command -v marp &> /dev/null; then
    echo "Error: marp command not found. Install with: npm install -g @marp-team/marp-cli" >&2
    exit 1
fi

# Run export
echo "Exporting: $INPUT_FILE"
echo "Formats: ${FORMATS[*]}"
echo "Output directory: $OUTPUT_DIR"
echo ""

for format in "${FORMATS[@]}"; do
    OUTPUT_FILE="$OUTPUT_DIR/$BASENAME.$format"

    case $format in
        pdf)
            echo "  -> $OUTPUT_FILE"
            marp "$INPUT_FILE" "${COMMON_OPTS[@]}" -o "$OUTPUT_FILE"
            ;;
        png)
            echo "  -> $OUTPUT_FILE (scale: $SCALE)"
            marp "$INPUT_FILE" "${COMMON_OPTS[@]}" --image-scale "$SCALE" -o "$OUTPUT_FILE"
            ;;
        pptx)
            echo "  -> $OUTPUT_FILE"
            marp "$INPUT_FILE" "${COMMON_OPTS[@]}" -o "$OUTPUT_FILE"
            ;;
        html)
            echo "  -> $OUTPUT_FILE"
            marp "$INPUT_FILE" "${COMMON_OPTS[@]}" --html -o "$OUTPUT_FILE"
            ;;
        *)
            echo "  Warning: Unknown format '$format', skipping" >&2
            ;;
    esac
done

echo ""
echo "Export completed!"

# List generated files
echo ""
echo "Generated files:"
for format in "${FORMATS[@]}"; do
    case $format in
        png)
            # PNG may produce numbered files
            ls -la "$OUTPUT_DIR/$BASENAME"*.png 2>/dev/null || true
            ;;
        *)
            if [[ -f "$OUTPUT_DIR/$BASENAME.$format" ]]; then
                ls -la "$OUTPUT_DIR/$BASENAME.$format"
            fi
            ;;
    esac
done
