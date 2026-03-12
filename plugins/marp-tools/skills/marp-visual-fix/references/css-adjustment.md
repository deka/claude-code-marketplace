# Marp CSS Adjustment Techniques

## Table of Contents

- [Using the style directive](#using-the-style-directive)
- [Per-slide style changes](#per-slide-style-changes)
- [Common CSS adjustments](#common-css-adjustments)
- [Flexbox layout](#flexbox-layout)
- [Responsive (size-specific)](#responsive-size-specific)
- [Debugging](#debugging)

## Using the style directive

Add custom CSS in the frontmatter.

```yaml
---
marp: true
style: |
  section {
    font-size: 24px;
  }
  h1 {
    color: navy;
  }
---
```

## Per-slide style changes

### Scoped styles

Apply styles per slide using HTML tags.

```markdown
---

<style scoped>
h1 { color: red; }
</style>

# This slide only has red heading

---

# This slide uses default color
```

## Common CSS adjustments

### Font size

```css
/* Base size for all */
section {
  font-size: 26px;
}

/* Heading sizes */
section h1 { font-size: 1.6em; }
section h2 { font-size: 1.3em; }
section h3 { font-size: 1.1em; }

/* Code size */
section pre code {
  font-size: 0.65em;
}

/* List size */
section ul, section ol {
  font-size: 0.95em;
}
```

### Margins and padding

```css
/* Slide margin */
section {
  padding: 40px 50px;
}

/* Heading margin */
section h1 {
  margin-bottom: 0.5em;
}

/* List item spacing */
section li {
  margin: 0.2em 0;
}

/* Paragraph spacing */
section p {
  margin: 0.8em 0;
}
```

### Line height

```css
section {
  line-height: 1.4;  /* 1.35-1.5 is readable */
}

section li {
  line-height: 1.3;
}

section pre code {
  line-height: 1.2;
}
```

### Colors

```css
/* Text color */
section {
  color: #333;
}

/* Heading color */
section h1, section h2, section h3 {
  color: #003981;
}

/* Link color */
section a {
  color: #0066cc;
}

/* Background color */
section {
  background-color: #fafafa;
}
```

### Tables

```css
/* Table overall */
section table {
  width: 100%;
  font-size: 0.85em;
  border-collapse: collapse;
}

/* Cells */
section th, section td {
  padding: 0.4em 0.6em;
  border: 1px solid #ccc;
}

/* Header row */
section thead th {
  background: #003981;
  color: white;
}

/* Alternating row color */
section tbody tr:nth-child(even) {
  background: #f5f5f5;
}
```

### Images

```css
/* Default image style */
section img {
  max-width: 100%;
  height: auto;
}

/* Image shadow */
section img:not([alt*="bg"]) {
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  border-radius: 4px;
}
```

### Code blocks

```css
/* Code block overall */
section pre {
  background: #2d2d2d;
  border-radius: 8px;
  padding: 1em;
}

/* Inline code */
section code:not(pre code) {
  background: #f0f0f0;
  padding: 0.1em 0.3em;
  border-radius: 3px;
  font-size: 0.9em;
}
```

### Quotes

```css
section blockquote {
  border-left: 4px solid #003981;
  padding-left: 1em;
  margin-left: 0;
  color: #555;
  font-style: italic;
}
```

## Flexbox layout

### Center alignment

```css
section.center {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
```

### Left-right split

```css
section.split {
  display: flex;
  flex-direction: row;
}

section.split > * {
  flex: 1;
  padding: 0 1em;
}
```

## Responsive (size-specific)

```css
/* 16:9 */
@media (aspect-ratio: 16/9) {
  section {
    font-size: 28px;
  }
}

/* 4:3 */
@media (aspect-ratio: 4/3) {
  section {
    font-size: 24px;
  }
}
```

## Debugging

```css
/* Visualize element boundaries */
section * {
  outline: 1px solid rgba(255,0,0,0.2);
}

/* Check areas with background color */
section header { background: rgba(255,0,0,0.1); }
section footer { background: rgba(0,255,0,0.1); }
```
