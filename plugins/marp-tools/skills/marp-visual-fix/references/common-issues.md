# Marp Common Display Issues

## Table of Contents

- [Text Issues](#text-issues)
- [Image Issues](#image-issues)
- [Layout Issues](#layout-issues)
- [PDF/Export Issues](#pdfexport-issues)

## Text Issues

### 1. Text Overflows the Slide

**Symptom**: Text is cut off beyond the slide edge

**Causes**:
- Too many bullet points
- Font size too large
- Long words don't wrap

**Solutions**:
- Limit bullet points to 5 items
- Split the slide
- Reduce `font-size`
- Add `word-break: break-all`

### 2. Heading Too Long

**Symptom**: Heading spans multiple lines and breaks layout

**Causes**:
- Heading text too long

**Solutions**:
- Shorten the heading
- Move to body as subtitle
- Adjust font size

### 3. Code Block Doesn't Fit

**Symptom**: Code is cut off or too small to read

**Causes**:
- Code too long
- `@auto-scaling` settings

**Solutions**:
- Extract key code only
- Split across multiple slides
- Adjust font size

## Image Issues

### 4. Image Not Displaying

**Symptom**: Image doesn't show, only alt text

**Causes**:
- Wrong path
- File doesn't exist
- External URL inaccessible

**Solutions**:
- Verify path (relative/absolute)
- Check file exists
- Verify URL accessibility

### 5. Image Aspect Ratio Distorted

**Symptom**: Image stretched vertically/horizontally

**Causes**:
- Both width and height specified
- `object-fit` not set in CSS

**Solutions**:
- Specify only width or height
- Use `object-fit: contain`

### 6. Background Image Hard to See

**Symptom**: Text over background image is hard to read

**Causes**:
- Insufficient contrast

**Solutions**:
- Add overlay to image
- Add shadow to text
- Adjust background image opacity

## Layout Issues

### 7. Slide Breaks Not as Expected

**Symptom**: Slides split at unexpected positions

**Causes**:
- Incorrect `---` placement
- `headingDivider` enabled

**Solutions**:
- Check `---` positions
- Disable `headingDivider`

### 8. Header/Footer Overlap

**Symptom**: Body overlaps with header/footer

**Causes**:
- Insufficient padding
- Header/footer height too large

**Solutions**:
- Increase section padding
- Reduce header/footer font size

### 9. Table Overflows

**Symptom**: Table exceeds slide width

**Causes**:
- Too many columns
- Cell content too long

**Solutions**:
- Reduce column count
- Reduce font size
- Split table

## PDF/Export Issues

### 10. Font Changes in PDF

**Symptom**: OK in HTML but different font in PDF

**Causes**:
- Font not installed
- Web font load failure

**Solutions**:
- Use Google Fonts
- Install local fonts

### 11. Images Disappear in PDF

**Symptom**: Displayed in HTML but gone in PDF

**Causes**:
- External URL access failure
- Unsupported image format

**Solutions**:
- Save images locally
- Convert to supported format (PNG/JPEG)

### 12. PDF Page Count Mismatch

**Symptom**: Slide count doesn't match PDF page count

**Causes**:
- Empty slides exist
- Content overflow causes auto-split

**Solutions**:
- Remove empty slides
- Adjust content amount
