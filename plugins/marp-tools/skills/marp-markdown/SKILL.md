---
name: marp-markdown
user-invocable: true
description: Create and edit Marp Markdown presentation files — slide content, structure, frontmatter, and directives. Use this skill whenever someone wants to make a slideshow, write a deck, draft a presentation, add or edit slides, or structure a talk. Triggers on "create slides", "write a presentation", "make a deck", "I need slides for...", "add a new slide", "help me with my talk", "edit this presentation".
---

# Marp Markdown Skill

Skill for creating and editing Marp Markdown presentations.

## When to Use

- "Create slides"
- "Create a presentation"
- "Create slides with Marp"
- "Write a presentation"

## Workflow

1. **Requirements**: Confirm presentation purpose, audience, and content with user
2. **Theme selection**: Choose theme (default/gaia/uncover/custom)
3. **Structure**: Create slide structure outline
4. **Markdown creation**: Write the actual slides
5. **Preview**: Verify with preview script

## Related Skills

- **marp-knowledge**: Directives, syntax, images, and detailed specifications

## Templates

- [basic-template.md](assets/basic-template.md) - Basic template
- [speee-template.md](assets/speee-template.md) - Speee theme template
- [content-patterns.md](assets/content-patterns.md) - Common slide patterns

## Scripts

- [preview.sh](scripts/preview.sh) - HTML preview generation

## Basic Structure

```markdown
---
marp: true
theme: default
paginate: true
---

<!--
_class: lead
_paginate: false
-->

# Presentation Title

Presenter Name
January 1, 2024

---

# Table of Contents

1. Introduction
2. Main Topic
3. Summary

---

# Main Topic

Write your content here

---

# Summary

- Point 1
- Point 2
- Point 3
```

## Best Practices

1. **One message per slide**: Avoid overcrowding
2. **Concise headings**: Avoid long headings
3. **5 bullet points max**: Too many makes it hard to read
4. **Use images**: Visual content over text-only
5. **Always include cover, table of contents, and summary**

$ARGUMENTS
