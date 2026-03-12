---
name: marp-theme-creator
description: Create new custom Marp themes. Supports theme design in SCSS/CSS, color palette definition, typography settings, and slide class implementation. Use when requests include "create a new Marp theme", etc.
---

# Marp Theme Creator Skill

Skill for creating new custom Marp themes.

## When to Use

- "Create a new Marp theme"
- "Create a company theme"
- "Design a custom theme"
- "Unify slide design"

## Workflow

1. **Requirements**: Confirm brand colors, fonts, and use case
2. **Design**: Design color palette, typography, and layout
3. **SCSS creation**: Write theme SCSS
4. **Slide class implementation**: Implement lead, cover, etc. classes
5. **Sample test**: Verify with sample slides

## Related Skills

- **marp-knowledge**: Theme system specification, CSS variables
- **marp-theme-builder**: Build environment setup (after creation)

## References

- [scss-structure.md](references/scss-structure.md) - SCSS structure guide
- [css-variables.md](references/css-variables.md) - CSS variables reference
- [slide-classes.md](references/slide-classes.md) - Slide class implementation

## Assets

- [theme-template.scss](assets/theme-template.scss) - Theme template
- [color-scheme-mixin.scss](assets/color-scheme-mixin.scss) - Color scheme mixin

## Theme Creation Checklist

### Required

- [ ] `@theme` metadata
- [ ] `@size` metadata (16:9, 4:3)
- [ ] Base section styles
- [ ] Heading (h1-h6) styles
- [ ] List styles
- [ ] Code block styles
- [ ] Table styles

### Recommended

- [ ] `lead` class (section divider)
- [ ] `cover` class (cover slide)
- [ ] Header/footer styles
- [ ] Page number styles
- [ ] Link styles
- [ ] Quote styles

### Optional

- [ ] `invert` class (inverted theme)
- [ ] Custom classes
- [ ] Logo placement
- [ ] Background decoration

## Design Principles

1. **Readability first**: Contrast ratio 4.5:1 or higher
2. **Consistency**: Unified colors and fonts
3. **Simplicity**: Minimal decoration
4. **Professional**: Business-appropriate design

$ARGUMENTS
