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

## Usage Guide

### 1. Creating slides

The **marp-markdown** skill triggers with phrases like:

| Example prompt |
|----------------|
| "Create slides for a presentation on [your topic]" |
| "Write a presentation for [my subject]" |
| "Create a deck with Marp for [context]" |
| "I need slides for a presentation on [X]" |
| "Help me make a presentation on [X]" |

**Example:**
```
Create slides for a 10-minute presentation on Python introduction 
for beginners. Include a title slide, table of contents,
and slides on variables, loops, and functions.
```

### 2. Choosing a theme

**Built-in themes** (default, gaia, uncover) — specify in the prompt:

| Example prompt |
|----------------|
| "Use the **default** theme" |
| "Use the **gaia** theme" |
| "Use the **uncover** theme" |

**Custom theme** — the **marp-theme-creator** skill triggers with:

| Example prompt |
|----------------|
| "Create a custom theme with my brand colors" |
| "Create a dark theme for my slides" |
| "Create a theme that matches our brand guidelines" |

### 3. Exporting to PDF

The **marp-export** skill triggers with:

| Example prompt |
|----------------|
| "Export to PDF" |
| "Convert to PDF" |
| "Generate a PDF of my presentation" |
| "Export slides.pdf" |

**Example:**
```
Export slides.md to PDF
```

### Full workflow in one prompt

```
Create slides for a 15-minute presentation on machine learning 
for data scientists. Use the uncover theme. Include an intro, 
table of contents, and 3 main sections. Then export the result to PDF.
```

## Prerequisites

- **Marp CLI** installed: `npm install -g @marp-team/marp-cli`
- **Node.js** installed

Verify installation: `marp --version`

## License

MIT License
