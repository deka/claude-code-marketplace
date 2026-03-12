# Marp Slide Class Implementation Patterns

## Table of Contents

- [Overview](#overview)
- [Standard Classes](#standard-classes)
- [Custom Class Examples](#custom-class-examples)
- [Combining Multiple Classes](#combining-multiple-classes)
- [Class Design Best Practices](#class-design-best-practices)
- [Class Reference Template](#class-reference-template)

## Overview

Implementation patterns for slide classes applied via the `_class` directive.

## Standard Classes

### lead (Section Divider)

Used for section breaks and heading slides.

```scss
section.lead {
  // Centered layout
  display: flex;
  flex-direction: column;
  justify-content: center;

  // Background color
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;

  // Heading style
  h1, h2 {
    text-align: center;
    font-size: 2em;
  }

  // Hide page number
  &::after {
    display: none;
  }
}
```

Usage example:
```markdown
<!--
_class: lead
-->

# Section Title
```

### cover (Cover Slide)

Used for the presentation cover.

```scss
section.cover {
  // Centered
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;

  // Background
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  color: white;

  // Large title
  h1 {
    font-size: 2.5em;
    margin-bottom: 0.5em;
  }

  // Date and author
  p {
    font-size: 1.2em;
    color: rgba(255,255,255,0.8);
  }

  // Hide page number, header, footer
  &::after { display: none; }
}
```

### invert (Inverted)

Inverts the normal theme colors.

```scss
section.invert {
  @include color-scheme(
    #333333,  // Background: dark
    #ffffff,  // Text: white
    #6eb5ff   // Highlight: light blue
  );

  // Code block adjustment
  pre > code {
    background: #1e1e1e;
  }
}
```

### center (Centered)

Centers content.

```scss
section.center {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;

  h1, h2, h3, p, ul, ol {
    text-align: center;
  }

  ul, ol {
    display: inline-block;
    text-align: left;
  }
}
```

## Custom Class Examples

### split (Left-Right Split)

```scss
section.split {
  display: flex;
  flex-direction: row;
  padding: 40px;

  > .left, > .right {
    flex: 1;
    padding: 0 20px;
  }

  > .left {
    border-right: 1px solid rgba(0,0,0,0.1);
  }
}
```

Note: Requires HTML usage:
```markdown
<!--
_class: split
-->

<div class="left">

# Left side
- Content

</div>
<div class="right">

# Right side
- Content

</div>
```

### emphasis (Emphasis)

```scss
section.emphasis {
  background: #fff3cd;
  border-left: 8px solid #ffc107;

  h1 {
    color: #856404;
  }
}
```

### quote (Quote Focus)

```scss
section.quote {
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 80px;

  blockquote {
    font-size: 1.5em;
    font-style: italic;
    border: none;

    &::before {
      content: '"';
      font-size: 3em;
      color: rgba(0,0,0,0.2);
    }
  }
}
```

### code-focus (Code Focus)

```scss
section.code-focus {
  pre {
    font-size: 0.9em;
    max-height: none;
  }

  h1 {
    font-size: 1.2em;
    margin-bottom: 0.3em;
  }
}
```

## Combining Multiple Classes

```markdown
<!--
_class: lead invert
-->
```

```scss
// lead + invert combination
section.lead.invert {
  background: #1a1a1a;
  color: white;
}
```

## Class Design Best Practices

1. **Minimal classes**: Limit to 3-5 types
2. **Naming convention**: Use descriptive names
3. **Combination support**: Consider multiple class coexistence
4. **Documentation**: Document usage
5. **Provide samples**: Include usage examples for each class

## Class Reference Template

Reference table for README, etc.:

```markdown
## Slide Classes

| Class | Purpose | Background |
|-------|---------|------------|
| (none) | Normal slide | White |
| `lead` | Section divider | Gradient |
| `cover` | Cover slide | Dark |
| `invert` | Inverted theme | Dark |
| `center` | Centered | White |
```
