---
name: marp-visual-fix
description: Diagnose and fix Marp slide display and layout problems — text overflow, image sizing, broken layouts, PDF rendering issues, font problems, and spacing. Use this skill proactively whenever something looks wrong with slides, content doesn't fit, images are cropped or too big, the layout is broken, or the exported output doesn't match the preview. Triggers on "fix the layout", "text overflows", "something looks wrong", "slides are broken", "image is cut off", "content doesn't fit", "PDF looks different", "font isn't showing".
---

# Marp Visual Fix Skill

Skill for diagnosing and fixing Marp slide display and layout issues.

## When to Use

- "Fix slide appearance"
- "Text overflows"
- "Image is cropped"
- "Layout is broken"
- "Breaks when exporting to PDF"

## Workflow

1. **Issue verification**: Export current slides to PNG for visual check
2. **Root cause analysis**: Analyze Markdown and theme
3. **Fix options**: Propose multiple fix options
4. **Apply fix**: Implement selected method
5. **Verification**: Compare images before/after

## Related Skills

- **marp-knowledge**: Directives, image syntax specifications

## Scripts

- [export_png.sh](scripts/export_png.sh) - Export to PNG images
- [compare_slides.py](scripts/compare_slides.py) - Compare before/after images

## References

- [common-issues.md](references/common-issues.md) - Common display issues
- [fix-patterns.md](references/fix-patterns.md) - Fix patterns by issue type
- [css-adjustment.md](references/css-adjustment.md) - CSS adjustment techniques

## Issue Diagnosis Checklist

1. **Text overflow**
   - Is font size too large?
   - Are there too many bullet points?
   - Is the heading too long?

2. **Image issues**
   - Is size specification correct?
   - Is the path correct?
   - Is aspect ratio preserved?

3. **Layout issues**
   - Are directives correct?
   - Is class specification correct?
   - Are slide break positions appropriate?

4. **PDF export issues**
   - Are external resources accessible?
   - Are fonts available?
   - Is image format supported?

$ARGUMENTS
