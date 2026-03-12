# Export Troubleshooting

## Table of Contents

- [PDF Issues](#pdf-issues)
- [PNG Issues](#png-issues)
- [PPTX Issues](#pptx-issues)
- [HTML Issues](#html-issues)
- [Common Issues](#common-issues)
- [Debugging](#debugging)

Common Marp export issues and solutions.

## PDF Issues

### Images not displaying

**Symptom**: PDF has no images or they appear broken

**Causes and solutions**:

1. **Local file access permission**
   ```bash
   # Add --allow-local-files
   marp slide.md --allow-local-files -o slide.pdf
   ```

2. **Image path should be relative**
   ```markdown
   <!-- NG: Absolute or invalid path -->
   ![](C:\Users\image.png)

   <!-- OK: Relative to Markdown file -->
   ![](./images/photo.png)
   ```

3. **External URL images**
   ```markdown
   <!-- External URLs require permission -->
   ![](https://example.com/image.png)
   ```
   ```bash
   marp slide.md --allow-local-files -o slide.pdf
   ```

### Font changes

**Symptom**: PDF generated with different font than in editor

**Solutions**:

1. **Use Google Fonts** (recommended)
   ```yaml
   ---
   marp: true
   style: |
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');
     section {
       font-family: 'Noto Sans JP', sans-serif;
     }
   ---
   ```

2. **Embed local fonts**
   - Ensure font is installed on system
   - Specify font name correctly

### Japanese text garbled

**Symptom**: Japanese text shows as □ or ?

**Solution**:

```yaml
---
marp: true
style: |
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700&display=swap');
  section {
    font-family: 'Noto Sans JP', sans-serif;
  }
  code {
    font-family: 'Noto Sans Mono', monospace;
  }
---
```

### PDF too large

**Symptom**: File size too big

**Solutions**:

1. **Optimize images**
   - PNG → JPEG (for photos)
   - Resize to display size

2. **Reduce embedded fonts**
   - Minimize font count
   - Limit font-weight variants

## PNG Issues

### Low resolution

**Symptom**: Blurry images, visible pixels

**Solution**:

```bash
# Increase scale (2x, 3x)
marp slide.md --image-scale 2 -o slide.png
marp slide.md --image-scale 3 -o slide.png
```

### Filename mismatch

**Symptom**: Want `slide.001.png` but get `slide.png`

**Solution**:

Multiple slides get automatic numbering.
Single slide outputs without number.

```bash
# Multiple slides → slide.001.png, slide.002.png, ...
# Single slide → slide.png
```

### Transparent background

**Symptom**: PNG background transparent when not intended

**Solution**:

```yaml
---
marp: true
style: |
   section {
     background-color: white;
   }
---
```

## PPTX Issues

### Text not editable

**Symptom**: Cannot edit text in PowerPoint

**Cause**:
Marp PPTX export embeds each slide as an **image**, so text editing is not possible.

**Alternatives**:

1. Edit Markdown source and re-export
2. Add text boxes over images in PowerPoint

### Slide size mismatch

**Symptom**: Doesn't match PowerPoint default size

**Solution**:

Specify size in frontmatter:

```yaml
---
marp: true
size: 16:9  # Same as PowerPoint standard widescreen
---
```

## HTML Issues

### Images not displaying (HTML)

**Symptom**: Images don't show when opening in browser

**Solution**:

1. **Standalone mode** to embed images
   ```bash
   marp slide.md --html --allow-local-files -o slide.html
   ```

2. **Keep relative paths**
   - Place images in same directory structure as HTML file

### Doesn't work offline

**Symptom**: HTML doesn't display correctly without internet

**Cause**: Loading styles/fonts from external CDN

**Solution**:

```bash
# Generate standalone HTML
marp slide.md --html --allow-local-files -o slide.html
```

### Mobile display issues

**Symptom**: Doesn't display correctly on mobile browser

**Solution**:

HTML includes viewport by default, but if issues persist:

```yaml
---
marp: true
style: |
  section {
    font-size: 24px; /* Adjust for mobile */
  }
---
```

## Common Issues

### marp command not found

**Symptom**: `marp: command not found`

**Solution**:

```bash
# Global install
npm install -g @marp-team/marp-cli

# Or run with npx
npx @marp-team/marp-cli slide.md -o slide.pdf
```

### Chromium not installed

**Symptom**: Chromium error when exporting PDF/PNG

**Solution**:

```bash
# Install Puppeteer Chromium
npx puppeteer browsers install chrome

# Or set Chrome path
export CHROME_PATH=/usr/bin/google-chrome
marp slide.md -o slide.pdf
```

### Out of memory

**Symptom**: Export fails with many slides

**Solutions**:

1. **Split slides** and export separately
2. **Reduce image size**
3. **Increase Node.js memory**
   ```bash
   NODE_OPTIONS=--max-old-space-size=4096 marp slide.md -o slide.pdf
   ```

### Export hangs

**Symptom**: Hangs during export

**Solution**:

```bash
# Extend timeout
marp slide.md --timeout 120000 -o slide.pdf  # 120 seconds

# Or split and export
```

## Debugging

### Verbose logging

```bash
# Debug mode via env var
DEBUG=marp* marp slide.md -o slide.pdf
```

### Test with HTML first

If PDF/PNG has issues, verify with HTML first:

```bash
# Check with HTML
marp slide.md -o slide.html
# Open in browser and verify

# If OK, export to PDF
marp slide.md -o slide.pdf
```

### Version check

```bash
marp --version
# Update if not latest
npm update -g @marp-team/marp-cli
```
