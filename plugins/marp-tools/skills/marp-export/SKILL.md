---
name: marp-export
description: Export Marp slides to PDF, PNG, PPTX, or HTML. Use this skill whenever someone wants to convert, save, share, or print their slides — including exporting each slide as an image, generating a PowerPoint, publishing as HTML, or preparing for a presentation. Triggers on "export to PDF", "convert to PowerPoint", "save as PNG", "output as images", "make it printable", "export each slide", "share the deck", "publish as HTML".
argument-hint: "<Markdown file path> [output format: pdf|png|pptx|html]"
---

# Marp Export Skill

Skill for exporting Marp slides to various formats.

## When to Use

- "Convert to PDF"
- "Export slides as PNG"
- "Output as PowerPoint"
- "Save as HTML"
- "Export for printing"
- "Export each slide as image"

## Supported Formats

| Format | Extension | Use case |
|--------|-----------|----------|
| PDF | `.pdf` | Distribution, printing (most common) |
| PNG | `.png` | Image embedding, SNS sharing, diff check |
| PPTX | `.pptx` | PowerPoint editing and presentation |
| HTML | `.html` | Web browser viewing and distribution |

## Workflow

1. **Input file verification**
   - Verify Markdown file path
   - Check frontmatter has `marp: true`

2. **Output format selection**
   - Choose format based on user needs
   - Distribution → PDF
   - Image embedding → PNG
   - Editable → PPTX
   - Web publishing → HTML

3. **Option configuration**
   - Theme CSS (when using custom theme)
   - Output directory
   - Image resolution (PNG)
   - Page size (PDF)

4. **Export execution**
   - Use `scripts/export.sh`
   - Or run `marp` command directly

5. **Result verification**
   - Confirm file generation
   - Preview if needed

## Basic Commands

```bash
# PDF output
marp slide.md -o slide.pdf

# PNG output (each slide as separate image)
marp slide.md -o slide.png

# PPTX output
marp slide.md -o slide.pptx

# HTML output
marp slide.md -o slide.html
```

## Common Options

```bash
# Use custom theme
marp slide.md --theme ./theme.css -o slide.pdf

# Specify theme directory
marp slide.md --theme-set ./themes/ -o slide.pdf

# Allow local files (for external images)
marp slide.md --allow-local-files -o slide.pdf

# Standalone HTML (embedded images)
marp slide.md --html -o slide.html
```

## Related Skills

- [marp-knowledge](../marp-knowledge/SKILL.md) - Marp basics
- [marp-visual-fix](../marp-visual-fix/SKILL.md) - Fix display issues when exporting

## References

- [export-options.md](./references/export-options.md) - Format-specific options
- [troubleshooting.md](./references/troubleshooting.md) - Common issues and solutions

## Scripts

- [export.sh](./scripts/export.sh) - Unified export script

$ARGUMENTS
