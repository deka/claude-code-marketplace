# Marp Theme SCSS Structure Guide

## Table of Contents

- [Recommended File Structure](#recommended-file-structure)
- [Main File Structure](#main-file-structure)
- [Variable Design](#variable-design)
- [Mixins](#mixins)
- [Best Practices](#best-practices)

## Recommended File Structure

```
my-theme/
├── theme.scss         # Main theme file
├── _variables.scss    # Variable definitions
├── _mixins.scss       # Mixins
├── _base.scss         # Base styles
├── _typography.scss   # Typography
├── _components.scss   # Components (tables, code, etc.)
└── _classes.scss      # Slide classes
```

A single file is acceptable for simple themes.

## Main File Structure

```scss
/*!
 * @theme my-theme
 * @auto-scaling true
 * @size 16:9 1280px 720px
 * @size 4:3 960px 720px
 */

// 1. Variable definitions
$color-primary: #003981;
$color-secondary: #005ea5;
$color-background: #ffffff;
$color-text: #333333;
$font-family-base: 'Noto Sans JP', sans-serif;
$font-family-code: 'Roboto Mono', monospace;

// 2. Font loading
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&family=Roboto+Mono&display=swap');

// 3. Mixin definitions
@mixin color-scheme($bg, $text, $highlight) {
  --color-background: #{$bg};
  --color-foreground: #{$text};
  --color-highlight: #{$highlight};
}

// 4. Base styles
section {
  // ...
}

// 5. Typography
h1, h2, h3, h4, h5, h6 {
  // ...
}

// 6. Components
table { /* ... */ }
pre { /* ... */ }
blockquote { /* ... */ }

// 7. Slide classes
section.lead { /* ... */ }
section.cover { /* ... */ }
```

## Variable Design

### Color Variables

```scss
// Primary color
$color-primary: #003981;
$color-primary-light: lighten($color-primary, 20%);
$color-primary-dark: darken($color-primary, 10%);

// Secondary color
$color-secondary: #005ea5;

// Text color
$color-text: #333333;
$color-text-light: #666666;
$color-text-muted: #999999;

// Background color
$color-background: #ffffff;
$color-background-alt: #f5f5f5;

// Accent color
$color-highlight: #0288d1;
$color-success: #28a745;
$color-warning: #ffc107;
$color-danger: #dc3545;
```

### Typography Variables

```scss
// Font family
$font-family-base: 'Noto Sans JP', 'Helvetica Neue', sans-serif;
$font-family-heading: 'Noto Sans JP', sans-serif;
$font-family-code: 'Roboto Mono', 'Consolas', monospace;

// Font size
$font-size-base: 28px;
$font-size-small: 0.85em;
$font-size-large: 1.2em;

// Heading sizes
$font-size-h1: 1.6em;
$font-size-h2: 1.3em;
$font-size-h3: 1.1em;
$font-size-h4: 1em;

// Line height
$line-height-base: 1.4;
$line-height-heading: 1.2;
```

### Spacing Variables

```scss
// Base unit
$spacing-unit: 8px;

// Padding
$padding-slide: 40px 50px;
$padding-code: 0.5em;

// Margin
$margin-heading: 0 0 0.5em 0;
$margin-paragraph: 0.8em 0;
$margin-list-item: 0.2em 0;
```

## Mixins

### Color Scheme

```scss
@mixin color-scheme($bg, $text, $highlight) {
  --color-background: #{$bg};
  --color-foreground: #{$text};
  --color-highlight: #{$highlight};
  --color-dimmed: #{mix($text, $bg, 70%)};
  --color-background-stripe: #{rgba($text, 0.05)};
}
```

### Flex Layout

```scss
@mixin flex-center {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

@mixin flex-split {
  display: flex;
  flex-direction: row;

  > * {
    flex: 1;
    padding: 0 1em;
  }
}
```

### Text Style

```scss
@mixin text-shadow-light {
  text-shadow: 0 1px 2px rgba(0,0,0,0.1);
}

@mixin text-truncate {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

## Best Practices

1. **Use CSS variables**: Consistent values across the theme
2. **Limit nesting to 3 levels**: Avoid deep nesting
3. **Add comments**: Document each section's purpose
4. **Modularize**: Split large themes into files
5. **Fallbacks**: Provide alternatives when web fonts fail to load
