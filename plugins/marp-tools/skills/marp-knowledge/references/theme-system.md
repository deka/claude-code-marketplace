# Marp Theme System

## Table of Contents

- [Overview](#overview)
- [Theme Metadata](#theme-metadata)
- [Slide Size](#slide-size)
- [Section (Slide) Styling](#section-slide-styling)
- [Slide Classes](#slide-classes)
- [Header and Footer](#header-and-footer)
- [Page Numbers](#page-numbers)
- [CSS Variables](#css-variables)
- [Auto-scaling](#auto-scaling)
- [Theme Inheritance](#theme-inheritance)
- [Using Web Fonts](#using-web-fonts)
- [SCSS Development](#scss-development)

## Overview

Marp themes are defined in CSS. When creating custom themes, use special metadata comments and CSS variables.

## Theme Metadata

Write at the top of the theme file as comments.

```css
/*!
 * @theme my-theme
 * @auto-scaling true
 * @size 16:9 1280px 720px
 * @size 4:3 960px 720px
 */
```

### Metadata Reference

| Metadata | Description | Example |
|----------|--------------|---------|
| `@theme` | Theme name (required) | `@theme custom-theme` |
| `@auto-scaling` | Text auto-scaling | `@auto-scaling true` |
| `@size` | Slide size definition | `@size 16:9 1280px 720px` |

## Slide Size

You can define multiple sizes.

```css
/*!
 * @theme my-theme
 * @size 16:9 1280px 720px
 * @size 4:3 960px 720px
 * @size A4 794px 1123px
 * @size A4-landscape 1123px 794px
 */
```

## Section (Slide) Styling

Style the entire slide with the `section` selector.

```css
section {
  width: 1280px;
  height: 720px;
  padding: 40px;
  background-color: white;
  color: #333;
  font-family: sans-serif;
  font-size: 28px;
}
```

## Slide Classes

Define classes applied via the `_class` directive.

```css
/* Normal slide */
section {
  background: white;
  color: #333;
}

/* Section title */
section.lead {
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
}

/* Cover slide */
section.cover {
  display: flex;
  flex-direction: column;
  justify-content: center;
  background: #1a1a2e;
  color: white;
}

/* Inverted theme */
section.invert {
  background: #333;
  color: white;
}
```

## Header and Footer

```css
header {
  position: absolute;
  top: 20px;
  left: 40px;
  right: 40px;
  font-size: 18px;
  color: #666;
}

footer {
  position: absolute;
  bottom: 20px;
  left: 40px;
  right: 40px;
  font-size: 14px;
  color: #999;
  text-align: right;
}
```

## Page Numbers

```css
section::after {
  /* Page number style */
  position: absolute;
  right: 40px;
  bottom: 20px;
  font-size: 18px;
  color: #999;
}
```

## CSS Variables

Built-in CSS variables available in themes.

```css
section {
  --color-background: white;
  --color-foreground: #333;
  --color-highlight: #0288d1;
  --color-dimmed: #666;
}
```

## Auto-scaling

When `@auto-scaling` is enabled, text is automatically adjusted to fit the slide.

```css
/*!
 * @auto-scaling true
 */

/* Fitting SVG style adjustment */
svg[data-marp-fitting="svg"] {
  max-height: 580px;
}
```

## Theme Inheritance

You can extend existing themes by inheriting them.

```css
/*!
 * @theme my-extended-theme
 */

@import 'default';

/* Customization */
section {
  font-family: 'Noto Sans JP', sans-serif;
}
```

## Using Web Fonts

When using Google Fonts, etc.

```css
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');

section {
  font-family: 'Noto Sans JP', sans-serif;
}
```

## SCSS Development

Develop complex themes in SCSS and compile to CSS.

```scss
// Variable definitions
$color-primary: #003981;
$color-secondary: #005ea5;

// Mixins
@mixin color-scheme($bg, $text, $highlight) {
  --color-background: #{$bg};
  --color-foreground: #{$text};
  --color-highlight: #{$highlight};
}

section {
  @include color-scheme(white, $color-primary, $color-secondary);
}

section.lead {
  @include color-scheme($color-primary, white, lighten($color-secondary, 30%));
}
```
