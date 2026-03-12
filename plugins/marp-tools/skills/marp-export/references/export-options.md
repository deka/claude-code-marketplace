# Export Options Reference

## Table of Contents

- [Common Options](#common-options)
- [PDF Export](#pdf-export)
- [PNG Export](#png-export)
- [PPTX Export](#pptx-export)
- [HTML Export](#html-export)
- [Batch Export](#batch-export)
- [Configuration File](#configuration-file)

Detailed reference for options available per output format.

## Common Options

| Option | Description | Example |
|--------|--------------|---------|
| `-o, --output` | Output filename | `-o slide.pdf` |
| `--theme` | Custom theme CSS | `--theme ./custom.css` |
| `--theme-set` | Theme directory | `--theme-set ./themes/` |
| `--allow-local-files` | Allow local file access | (flag only) |
| `--html` | Enable HTML tags | (flag only) |

## PDF Export

### Basic command

```bash
marp slide.md -o slide.pdf
```

### PDF-specific options

| Option | Description | Default |
|--------|--------------|---------|
| `--pdf-notes` | Include speaker notes | false |
| `--pdf-outlines` | Add outline (bookmarks) | true |
| `--pdf-outlines.pages` | Add each page to outline | true |
| `--pdf-outlines.headings` | Add headings to outline | true |

### Examples

```bash
# PDF with speaker notes
marp slide.md --pdf-notes -o slide.pdf

# PDF without outline
marp slide.md --pdf-outlines false -o slide.pdf

# PDF with custom theme
marp slide.md --theme ./theme.css --allow-local-files -o slide.pdf
```

### PDF size

Specify in frontmatter:

```yaml
---
marp: true
size: 16:9  # Standard widescreen (default)
---
```

Available sizes:
- `16:9` - 1280x720px (widescreen)
- `4:3` - 960x720px (standard)
- `A4` - 210x297mm (portrait)
- `A4-landscape` - 297x210mm (landscape)

## PNG Export

### Basic command

```bash
marp slide.md -o slide.png
```

Multiple slides get automatic numbering:
- `slide.001.png`
- `slide.002.png`
- ...

### PNG-specific options

| Option | Description | Default |
|--------|--------------|---------|
| `--image-scale` | Image scale (resolution) | 1 |
| `--images` | Image format | png |

### Examples

```bash
# High-resolution PNG (2x scale)
marp slide.md --image-scale 2 -o slide.png

# JPEG output
marp slide.md --images jpeg -o slide.jpg

# Single slide only (first page)
marp slide.md --images png -o slide.png
# → Delete others if only slide.001.png needed
```

### Resolution guide

| Scale | Resolution (16:9) | Use case |
|-------|-------------------|----------|
| 1 | 1280x720 | Screen, preview |
| 2 | 2560x1440 | High-res display |
| 3 | 3840x2160 | Print, 4K |

## PPTX Export

### Basic command

```bash
marp slide.md -o slide.pptx
```

### Notes

- **Image export**: Each slide is embedded as non-editable image
- **No animations**: Marp animations become static
- **Fonts**: Not embedded, may differ by viewer

### Examples

```bash
# Basic PPTX export
marp slide.md -o slide.pptx

# With local images
marp slide.md --allow-local-files -o slide.pptx
```

### PPTX use cases

- Present with PowerPoint
- Combine with other PowerPoint slides
- Distribute where only PowerPoint is accepted

## HTML Export

### Basic command

```bash
marp slide.md -o slide.html
```

### HTML types

1. **Standard HTML** (external resources)
   ```bash
   marp slide.md -o slide.html
   ```

2. **Standalone HTML** (embedded resources)
   ```bash
   marp slide.md --html -o slide.html
   ```

### HTML-specific options

| Option | Description |
|--------|--------------|
| `--bespoke.transition` | Slide transition animation |
| `--bespoke.progress` | Progress bar |
| `--watch` | File watch (development) |
| `--server` | Local server |

### Examples

```bash
# Presentation mode (with progress bar)
marp slide.md --bespoke.progress -o slide.html

# Dev server (live reload)
marp slide.md --server --watch

# Standalone HTML (distribution)
marp slide.md --html --allow-local-files -o slide.html
```

### HTML presentation controls

- `→` / `Space` : Next slide
- `←` : Previous slide
- `f` : Fullscreen
- `o` : Slide overview
- `p` : Presenter mode

## Batch Export

Export multiple formats at once:

```bash
# All formats
marp slide.md -o slide.pdf && \
marp slide.md -o slide.png && \
marp slide.md -o slide.pptx && \
marp slide.md -o slide.html
```

Or use `scripts/export.sh`:

```bash
./scripts/export.sh slide.md --all
```

## Configuration File

Define defaults in `.marprc.yml`:

```yaml
allowLocalFiles: true
html: true
theme: ./themes/custom.css
pdf:
  outlines: true
  notes: false
```

Place in project root for automatic application.
