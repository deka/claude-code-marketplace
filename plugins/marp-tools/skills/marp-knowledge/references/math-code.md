# Marp Math and Code

## Table of Contents

- [Math](#math)
- [Code Blocks](#code-blocks)
- [Inline Code](#inline-code)
- [Code Highlight Themes](#code-highlight-themes)
- [Code Annotations](#code-annotations)
- [Math and Code Together](#math-and-code-together)
- [Notes](#notes)

## Math

### Enabling

Specify the math engine in the frontmatter.

```yaml
---
marp: true
math: mathjax
---
```

or

```yaml
---
marp: true
math: katex
---
```

### Inline Math

```markdown
Formula in text: $E = mc^2$
```

### Block Math

```markdown
$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$
```

### Math Examples

```markdown
## Quadratic Formula

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

## Matrix

$$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
\begin{pmatrix}
x \\
y
\end{pmatrix}
=
\begin{pmatrix}
ax + by \\
cx + dy
\end{pmatrix}
$$

## Summation

$$
\sum_{i=1}^{n} i = \frac{n(n+1)}{2}
$$
```

## Code Blocks

### Basic Syntax

````markdown
```language
code
```
````

### Syntax Highlighting

Supported languages: javascript, python, ruby, go, rust, java, c, cpp, csharp, php, shell, bash, yaml, json, sql, html, css, markdown, etc.

````markdown
```javascript
function hello(name) {
  return `Hello, ${name}!`;
}
```
````

### Disabling Line Numbers

Line numbers are not displayed by default. Customizable via CSS.

### Code Block Auto-Fitting

When `@auto-scaling` is enabled, long code is automatically scaled down.

```css
pre > code svg[data-marp-fitting="svg"] {
  max-height: calc(580px - 1em);
}
```

## Inline Code

```markdown
Use the `count` variable.
```

### Inline Code Styling

```css
code {
  background: #f0f0f0;
  padding: 0.1em 0.3em;
  border-radius: 3px;
  font-family: 'Roboto Mono', monospace;
}
```

## Code Highlight Themes

You can use highlight.js themes.

```css
@import url('https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/styles/github.min.css');
```

Popular themes:
- `github.min.css` - GitHub style
- `monokai.min.css` - Dark theme
- `tomorrow-night-blue.min.css` - Blue background
- `vs2015.min.css` - Visual Studio style
- `atom-one-dark.min.css` - Atom style

## Code Annotations

Marp does not provide built-in support for markers inside code, but you can achieve this with HTML.

```html
<pre><code>
function example() {
  <mark>Important line</mark>
  return true;
}
</code></pre>
```

## Math and Code Together

```markdown
---
marp: true
math: katex
---

# Algorithm Explanation

Time complexity is $O(n \log n)$.

```python
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)
```

Average recursion depth is $\log n$.
```

## Notes

1. **Math engine works with Marp CLI / VS Code extension**
2. **KaTeX is faster, MathJax has better compatibility**
3. **Code block language names should be lowercase**
4. **Long code is scaled down rather than scrolled**
