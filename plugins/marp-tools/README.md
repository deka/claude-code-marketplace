# Marp Skills

Marp presentation skill set for Claude Code.

## Skills Overview

| Skill | Description |
|-------|-------------|
| [marp-knowledge](marp-knowledge/) | Marp syntax reference — directives, themes, images, math/code |
| [marp-markdown](marp-markdown/) | Create and edit Marp slides — content, structure, frontmatter, directives |
| [marp-visual-fix](marp-visual-fix/) | Diagnose and fix display/layout problems — overflow, images, broken layouts, PDF rendering |
| [marp-export](marp-export/) | Export to PDF, PNG, PPTX, or HTML for sharing, printing, or web publishing |
| [marp-theme-creator](marp-theme-creator/) | Design custom themes from scratch — SCSS/CSS, color palettes, branding, slide classes |
| [marp-theme-builder](marp-theme-builder/) | Automate theme builds — SCSS compilation, Makefile, Git hooks, GitHub Actions CI |

## Dependencies

```
                    marp-knowledge (knowledge base)
                         │
         ┌───────────────┼───────────────┐
         │               │               │
         ▼               ▼               ▼
   marp-markdown   marp-visual-fix   marp-theme-creator
                         │               │
                         ▼               ▼
                    marp-export    marp-theme-builder
```

## Installation

Add this repository as a skill in your Claude Code configuration.

## License

MIT License
