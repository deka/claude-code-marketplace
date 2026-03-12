# Marp Image Syntax

## Table of Contents

- [Basic Syntax](#basic-syntax)
- [Size Specification](#size-specification)
- [Image Filters](#image-filters)
- [Background Images](#background-images)
- [Split Background](#split-background)
- [Multiple Background Images](#multiple-background-images)
- [Background Color](#background-color)
- [Image Placement (in Markdown)](#image-placement-in-markdown)
- [External Images](#external-images)
- [Image Aspect Ratio](#image-aspect-ratio)
- [Notes](#notes)

## Basic Syntax

Use standard Markdown image syntax.

```markdown
![Alt text](image.png)
```

## Size Specification

### Width

```markdown
![width:300px](image.png)
![w:300px](image.png)
![w:50%](image.png)
```

### Height

```markdown
![height:200px](image.png)
![h:200px](image.png)
```

### Width and Height

```markdown
![width:300px height:200px](image.png)
![w:300 h:200](image.png)
```

## Image Filters

You can apply CSS filters.

```markdown
![blur:5px](image.png)
![brightness:1.5](image.png)
![contrast:200%](image.png)
![drop-shadow:0,5px,10px,rgba(0,0,0,.4)](image.png)
![grayscale:100%](image.png)
![hue-rotate:180deg](image.png)
![invert:100%](image.png)
![opacity:50%](image.png)
![saturate:200%](image.png)
![sepia:100%](image.png)
```

## Background Images

Use the `bg` keyword to set an image as background.

### Basic Background

```markdown
![bg](background.jpg)
```

### Size Specification

```markdown
![bg contain](image.png)    /* Fit entire image */
![bg cover](image.png)      /* Cover entire area */
![bg fit](image.png)        /* Same as contain */
![bg auto](image.png)       /* Original size */
![bg 50%](image.png)        /* Percentage */
```

### Position Specification

```markdown
![bg left](image.png)
![bg right](image.png)
![bg top](image.png)
![bg bottom](image.png)
![bg center](image.png)
```

### Combined Specification

```markdown
![bg right:30%](image.png)     /* Place on right 30% */
![bg left:40% contain](image.png)
```

## Split Background

Split the screen and place an image.

```markdown
![bg left](image.png)

# Title

Text is displayed on the right side.
```

```markdown
![bg right:40%](image.png)

# Title

Text is displayed on the left 60%.
```

## Multiple Background Images

Using multiple `![bg]` displays images side by side.

```markdown
![bg](image1.png)
![bg](image2.png)
![bg](image3.png)
```

### Stack Vertically

```markdown
![bg vertical](image1.png)
![bg](image2.png)
```

## Background Color

Specify via CSS or use a directive.

```markdown
<!--
_backgroundColor: #f5f5f5
-->
```

## Image Placement (in Markdown)

### Center Alignment

Images placed as paragraphs are automatically centered.

```markdown
Text

![w:400](image.png)

Next text
```

### Inline Image

```markdown
Place an icon ![h:20](icon.png) inline in text
```

## External Images

You can use external images via URL.

```markdown
![bg](https://example.com/image.jpg)
```

## Image Aspect Ratio

Aspect ratio is maintained by default. Use CSS to force distortion.

```css
section img {
  object-fit: fill;
}
```

## Notes

1. **Local paths are relative to the slide file**
2. **External images are downloaded when exporting to PDF**
3. **Large images affect build time**
4. **For GitHub raw URLs, use `raw.githubusercontent.com`**
