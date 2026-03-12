# Marp Fix Patterns by Issue Type

## Table of Contents

- [Text Overflow Fixes](#text-overflow-fixes)
- [Image Issue Fixes](#image-issue-fixes)
- [Layout Fixes](#layout-fixes)
- [Table Fixes](#table-fixes)
- [Code Block Fixes](#code-block-fixes)
- [PDF Output Fixes](#pdf-output-fixes)

## Text Overflow Fixes

### Pattern 1: Font Size Adjustment

**When to use**: Generally too much text

```css
/* In theme or style directive */
section {
  font-size: 24px;  /* Reduce from default 28-30px */
}
```

### Pattern 2: Bullet List Spacing

**When to use**: Bullet list overflows vertically

```css
section ul > li,
section ol > li {
  margin: 0.1em 0;  /* Tighter than default */
  line-height: 1.2;
}
```

### Pattern 3: Slide Split

**When to use**: Too much content on one slide

```markdown
# Topic (part 1)

- Item 1
- Item 2
- Item 3

---

# Topic (part 2)

- Item 4
- Item 5
```

## Image Issue Fixes

### Pattern 1: Explicit Size

**When to use**: Image size unstable

```markdown
<!-- Before -->
![](image.png)

<!-- After -->
![w:600](image.png)
```

### Pattern 2: Background Image Adjustment

**When to use**: Background image cropped/distorted

```markdown
<!-- Before -->
![bg](image.png)

<!-- After - show entire image -->
![bg contain](image.png)

<!-- After - cover area -->
![bg cover](image.png)
```

### Pattern 3: Separate Image and Text

**When to use**: Image and text overlap

```markdown
<!-- Before - overlapping -->
![bg](image.png)
# Title

<!-- After - split layout -->
![bg left:40%](image.png)
# Title
Text placed on the right
```

## Layout Fixes

### Pattern 1: Center Alignment

**When to use**: Want to center content

```css
section.center {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}
```

```markdown
<!--
_class: center
-->
# Centered content
```

### Pattern 2: Margin Adjustment

**When to use**: Too close to edge or too far

```css
section {
  padding: 50px 60px;  /* 50px top/bottom, 60px left/right */
}
```

### Pattern 3: Hide Header/Footer

**When to use**: Header/footer not needed on specific slide

```markdown
<!--
_header: ''
_footer: ''
-->
```

## Table Fixes

### Pattern 1: Table Width Limit

**When to use**: Table overflows

```css
section table {
  font-size: 0.8em;
  width: 100%;
  table-layout: fixed;
}

section table td,
section table th {
  word-wrap: break-word;
}
```

### Pattern 2: Simplify Table

**When to use**: Too many columns

```markdown
<!-- Before - many columns -->
| A | B | C | D | E | F |
|---|---|---|---|---|---|
| 1 | 2 | 3 | 4 | 5 | 6 |

<!-- After - key columns only -->
| A | C | E |
|---|---|---|
| 1 | 3 | 5 |
```

## Code Block Fixes

### Pattern 1: Reduce Font Size

**When to use**: Code too long

```css
section pre code {
  font-size: 0.6em;  /* Reduce from default 0.7-0.8em */
}
```

### Pattern 2: Code Excerpt

**When to use**: Full code not needed, only key points

````markdown
<!-- Before - full code -->
```python
def function():
    # lots of code
    pass
```

<!-- After - excerpt with comment -->
```python
def function():
    # ... initialization ...
    result = important_operation()  # ← key part
    # ... cleanup ...
```
````

## PDF Output Fixes

### Pattern 1: Use Local Images

**When to use**: External URL images disappear in PDF

```markdown
<!-- Before -->
![](https://example.com/image.png)

<!-- After - download and use locally -->
![](./images/image.png)
```

### Pattern 2: Web Font Verification

**When to use**: Font gets replaced

```css
/* Wait for font to load */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');

section {
  font-family: 'Noto Sans JP', sans-serif;
}
```
