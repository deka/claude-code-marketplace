# Marp Skills

Marp presentation skill set for Claude Code.

## Skills Overview

| Skill | Description |
|-------|-------------|
| [marp-knowledge](marp-knowledge/) | Comprehensive Marp knowledge base (reference for other skills) |
| [marp-markdown](marp-markdown/) | Markdown slide creation support |
| [marp-visual-fix](marp-visual-fix/) | Display and layout issue fixes |
| [marp-export](marp-export/) | Export to PDF/PNG/PPTX/HTML |
| [marp-theme-creator](marp-theme-creator/) | Custom theme creation |
| [marp-theme-builder](marp-theme-builder/) | Build pipeline setup |

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
