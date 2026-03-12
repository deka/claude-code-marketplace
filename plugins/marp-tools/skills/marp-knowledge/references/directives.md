# Marp Directives

## Table of Contents

- [Overview](#overview)
- [Frontmatter (YAML format)](#frontmatter-yaml-format)
- [Global Directives](#global-directives)
- [Local Directives](#local-directives)
- [Spot Directives](#spot-directives)
- [Multiple Class Specification](#multiple-class-specification)
- [Example: Cover Slide](#example-cover-slide)

## Overview

Marp directives are special settings that control slide appearance and behavior. There are two types: global and local directives.

## Frontmatter (YAML format)

Write at the top of the file in YAML format.

```yaml
---
marp: true
theme: default
paginate: true
header: 'Header text'
footer: 'Footer text'
---
```

## Global Directives

Settings that apply to all slides.

| Directive | Description | Example |
|-----------|--------------|---------|
| `marp` | Enable Marp | `marp: true` |
| `theme` | Specify theme | `theme: default` / `theme: gaia` / `theme: uncover` |
| `paginate` | Show page numbers | `paginate: true` |
| `header` | Header text | `header: 'Title'` |
| `footer` | Footer text | `footer: '© 2024'` |
| `size` | Slide size | `size: 16:9` / `size: 4:3` / `size: A4` |
| `style` | Custom CSS | `style: \| section { background: #f5f5f5; }` |
| `headingDivider` | Auto page break on headings | `headingDivider: 2` |
| `math` | Math engine | `math: mathjax` / `math: katex` |

## Local Directives

Settings that apply only to specific slides. Written as HTML comments.

### Basic Syntax

```markdown
---
Slide content

<!--
_class: lead
_backgroundColor: #000
_color: #fff
-->
```

### Available Local Directives

| Directive | Description | Example |
|-----------|--------------|---------|
| `_class` | Apply CSS class | `_class: lead` |
| `_backgroundColor` | Background color | `_backgroundColor: #f0f0f0` |
| `_backgroundImage` | Background image | `_backgroundImage: url('image.jpg')` |
| `_backgroundPosition` | Background position | `_backgroundPosition: center` |
| `_backgroundRepeat` | Background repeat | `_backgroundRepeat: no-repeat` |
| `_backgroundSize` | Background size | `_backgroundSize: cover` |
| `_color` | Text color | `_color: #333` |
| `_header` | Override header | `_header: ''` (hide) |
| `_footer` | Override footer | `_footer: ''` (hide) |
| `_paginate` | Override page number | `_paginate: false` |

### Directives Without Underscore

Without the underscore, the directive applies to that slide and all following slides.

```markdown
<!--
class: invert
-->
This slide and all following slides will have the invert class applied
```

## Spot Directives

Additional directives available in Marp CLI / VS Code extension.

```html
<!-- fit -->
# Fit title to slide width
```

## Multiple Class Specification

You can specify multiple classes separated by spaces.

```html
<!--
_class: lead invert
-->
```

## Example: Cover Slide

```markdown
---
marp: true
theme: default
paginate: true
---

<!--
_class: lead
_paginate: false
_header: ''
_footer: ''
-->

# Presentation Title

Presenter Name
January 1, 2024
```
