# Marp Slide Content Patterns

Common slide patterns and examples.

## Table of Contents

- [Cover Patterns](#cover-patterns)
- [Table of Contents Patterns](#table-of-contents-patterns)
- [Section Dividers](#section-dividers)
- [Bullet List Patterns](#bullet-list-patterns)
- [Comparison Patterns](#comparison-patterns)
- [Image Placement Patterns](#image-placement-patterns)
- [Quote Patterns](#quote-patterns)
- [Code Patterns](#code-patterns)
- [Numbers & Data Patterns](#numbers--data-patterns)
- [Summary Patterns](#summary-patterns)
- [Closing Slide](#closing-slide)
- [Contact Info](#contact-info)

## Cover Patterns

### Simple cover

```markdown
<!--
_class: lead
_paginate: false
-->

# Title

Presenter Name
January 1, 2024
```

### Cover with company logo

```markdown
<!--
_class: cover
_paginate: false
-->

# Title

![bg right:30% w:200](logo.png)

Team Name
January 1, 2024
```

## Table of Contents Patterns

### Simple table of contents

```markdown
# Table of Contents

1. Introduction
2. Background
3. Proposal
4. Summary
```

### Agenda with timing

```markdown
# Agenda

| Section | Time |
|---------|------|
| Introduction | 5 min |
| Background | 10 min |
| Proposal | 15 min |
| Q&A | 10 min |
```

## Section Dividers

```markdown
<!--
_class: lead
-->

# Section Name
```

## Bullet List Patterns

### Basic

```markdown
# Key Points

- Point 1
- Point 2
- Point 3
```

### Nested

```markdown
# Details

- Main item 1
    - Detail A
    - Detail B
- Main item 2
    - Detail C
    - Detail D
```

### Numbered

```markdown
# Steps

1. Step 1
2. Step 2
3. Step 3
```

## Comparison Patterns

### Table comparison

```markdown
# Comparison

| Item | Option A | Option B |
|------|----------|----------|
| Cost | Low | High |
| Speed | Medium | High |
| Quality | High | High |
```

### Left-right split

```markdown
# Before / After

![bg left:50%](before.png)
![bg right:50%](after.png)
```

## Image Placement Patterns

### Center

```markdown
# Architecture

![w:800](architecture.png)
```

### Right side

```markdown
![bg right:40%](image.png)

# Title

- Text on the left
- Image on right 40%
```

### Multiple images

```markdown
# Screenshots

![bg](screenshot1.png)
![bg](screenshot2.png)
![bg](screenshot3.png)
```

## Quote Patterns

```markdown
# User Feedback

> This feature cut our work time in half.
> — Dev Team A
```

## Code Patterns

### Basic

````markdown
# Implementation Example

```javascript
function greet(name) {
    return `Hello, ${name}!`;
}
```
````

### Multiple languages

````markdown
# Multi-language

**JavaScript**
```javascript
console.log("Hello");
```

**Python**
```python
print("Hello")
```
````

## Numbers & Data Patterns

### KPI display

```markdown
# Results

## Impact

- **50%** work time reduction
- **30%** cost reduction
- **99.9%** availability achieved
```

### Chart alternative

```markdown
# Trends

| Month | Sales |
|-------|-------|
| Jan | ████████ 80 |
| Feb | ██████████ 100 |
| Mar | ████████████ 120 |
```

## Summary Patterns

### Bullet summary

```markdown
# Summary

- **Point 1**: Description
- **Point 2**: Description
- **Point 3**: Description
```

### Action items

```markdown
# Next Actions

| Item | Owner | Deadline |
|------|-------|----------|
| Task 1 | [Name] | 1/15 |
| Task 2 | [Name] | 1/20 |
```

## Closing Slide

```markdown
<!--
_class: lead
-->

# Thank you for your attention

Q&A and discussion
```

## Contact Info

```markdown
<!--
_class: lead
-->

# Thank You!

📧 email@example.com
🔗 github.com/username
```
