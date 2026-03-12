# Marp CSS Variables Reference

## Table of Contents

- [Marp Built-in Variables](#marp-built-in-variables)
- [Recommended Custom Variables](#recommended-custom-variables)
- [Variable Inheritance](#variable-inheritance)
- [Using Variables in SCSS](#using-variables-in-scss)
- [Combining with calc()](#combining-with-calc)
- [Media Query Overrides](#media-query-overrides)
- [Dark Mode Support](#dark-mode-support)
- [Reference Table](#reference-table)

## Marp Built-in Variables

Variables used internally by Marp. You can customize behavior by defining them in your theme.

### Slide Size

```css
section {
  /* Slide width and height (set via @size metadata) */
  width: 1280px;
  height: 720px;
}
```

### Auto-scaling

```css
/* Max height for fitting SVG */
svg[data-marp-fitting="svg"] {
  max-height: 580px;  /* Slide height - padding */
}
```

## Recommended Custom Variables

Variables that are useful to define in themes.

### Colors

```css
section {
  /* Base colors */
  --color-background: #ffffff;
  --color-foreground: #333333;

  /* Accent color */
  --color-highlight: #0288d1;
  --color-dimmed: #666666;

  /* Background pattern */
  --color-background-stripe: rgba(0,0,0,0.05);

  /* Border color */
  --color-border: #cccccc;
}
```

### Usage Example

```css
section {
  background-color: var(--color-background);
  color: var(--color-foreground);
}

section a {
  color: var(--color-highlight);
}

section table th,
section table td {
  border-color: var(--color-border);
}
```

## Variable Inheritance

CSS variables cascade, so they can be overridden per class.

```css
/* Normal slide */
section {
  --color-background: white;
  --color-foreground: #333;
}

/* Inverted slide */
section.invert {
  --color-background: #333;
  --color-foreground: white;
}

/* Lead slide */
section.lead {
  --color-background: linear-gradient(135deg, #667eea, #764ba2);
  --color-foreground: white;
}
```

## Using Variables in SCSS

Combine SCSS variables with CSS variables.

```scss
// SCSS variables (resolved at compile time)
$primary-color: #003981;
$secondary-color: #005ea5;

// Export as CSS variables
section {
  --color-primary: #{$primary-color};
  --color-secondary: #{$secondary-color};
  --color-background: white;
  --color-foreground: #{$primary-color};
}
```

## Combining with calc()

```css
section {
  --slide-padding: 40px;
  --content-max-height: calc(720px - var(--slide-padding) * 2);

  padding: var(--slide-padding);
}

svg[data-marp-fitting="svg"] {
  max-height: var(--content-max-height);
}
```

## Media Query Overrides

```css
/* 4:3 slide size */
@media (aspect-ratio: 4/3) {
  section {
    --slide-padding: 30px;
    --font-size-base: 24px;
  }
}

/* 16:9 slide size */
@media (aspect-ratio: 16/9) {
  section {
    --slide-padding: 40px;
    --font-size-base: 28px;
  }
}
```

## Dark Mode Support

```css
/* Light mode (default) */
section {
  --color-background: #ffffff;
  --color-foreground: #333333;
  --color-highlight: #0066cc;
}

/* Dark mode */
section.dark {
  --color-background: #1a1a2e;
  --color-foreground: #e0e0e0;
  --color-highlight: #6eb5ff;
}
```

## Reference Table

| Variable | Purpose | Example |
|----------|---------|---------|
| `--color-background` | Background color | `#ffffff` |
| `--color-foreground` | Text color | `#333333` |
| `--color-highlight` | Link/emphasis color | `#0288d1` |
| `--color-dimmed` | Muted color (footer, etc.) | `#666666` |
| `--color-border` | Border color | `#cccccc` |
| `--color-background-stripe` | Table stripe | `rgba(0,0,0,0.05)` |
| `--slide-padding` | Slide padding | `40px` |
| `--font-size-base` | Base font size | `28px` |
