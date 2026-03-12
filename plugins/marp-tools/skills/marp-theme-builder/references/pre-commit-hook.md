# Marp Theme Git pre-commit Hook Setup

## Table of Contents

- [Overview](#overview)
- [Basic Setup](#basic-setup)
- [Advanced Patterns](#advanced-patterns)
- [Makefile Integration](#makefile-integration)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)

## Overview

Use the pre-commit hook to ensure the build succeeds before committing.
This prevents broken themes or stale generated images from being committed.

## Basic Setup

### 1. Create hooks directory

```bash
mkdir -p .githooks
```

### 2. Create pre-commit script

`.githooks/pre-commit`:

```bash
#!/bin/sh

# Run build
echo "pre-commit: Build check..."
build_result=$(make 2>&1)
build_rc=$?

if [ $build_rc -ne 0 ]; then
    echo "====================================="
    echo "pre-commit: Build failed"
    echo "====================================="
    echo "$build_result"
    echo ""
    echo "Fix errors before committing again."
    exit 1
fi

echo "pre-commit: Build successful"
exit 0
```

### 3. Add execute permission

```bash
chmod +x .githooks/pre-commit
```

### 4. Configure Git

```bash
git config core.hooksPath .githooks
```

## Advanced Patterns

### Auto-stage generated files

```bash
#!/bin/sh

echo "pre-commit: Running build..."

# Run build
if ! make; then
    echo "pre-commit: Build failed"
    exit 1
fi

# Stage generated files
git add marp-themes/*.css
git add example/example.*.png

echo "pre-commit: Done"
exit 0
```

### Check only changed files

```bash
#!/bin/sh

# Build only when SCSS or MD changed
changed_files=$(git diff --cached --name-only)

if echo "$changed_files" | grep -qE '\.(scss|md)$'; then
    echo "pre-commit: Theme files changed. Running build..."

    if ! make; then
        echo "pre-commit: Build failed"
        exit 1
    fi

    # Auto-add generated files
    git add marp-themes/*.css example/example.*.png
fi

exit 0
```

### Image diff check

```bash
#!/bin/sh

echo "pre-commit: Build and image check..."

# Backup current images
mkdir -p /tmp/marp-backup
cp example/example.*.png /tmp/marp-backup/ 2>/dev/null || true

# Run build
if ! make clean all; then
    echo "pre-commit: Build failed"
    exit 1
fi

# Image diff check (optional)
if command -v composite &> /dev/null; then
    for backup in /tmp/marp-backup/*.png; do
        if [ -f "$backup" ]; then
            name=$(basename "$backup")
            if [ -f "example/$name" ]; then
                diff=$(composite -compose difference \
                    "example/$name" "$backup" - | \
                    identify -format '%[mean]' -)

                if [ "$(echo "$diff > 0.001" | bc)" -eq 1 ]; then
                    echo "Warning: Image diff detected: $name"
                fi
            fi
        fi
    done
fi

rm -rf /tmp/marp-backup

echo "pre-commit: Done"
exit 0
```

## Makefile Integration

Auto-setup with `make init`:

```makefile
init:
	@echo "Setting up Git hooks..."
	git config core.hooksPath .githooks
	@echo "Installing sass..."
	npm install -g sass
	@echo "Initialization complete"
```

## Troubleshooting

### Hook not running

```bash
# Check config
git config --get core.hooksPath

# Check permissions
ls -la .githooks/pre-commit

# Manual test
./.githooks/pre-commit
```

### Skip hook

```bash
# Temporarily skip (not recommended)
git commit --no-verify -m "Emergency fix"
```

### Disable hook

```bash
# Reset hooksPath to default
git config --unset core.hooksPath
```

## Best Practices

1. **Keep it fast**: Hook should complete in seconds
2. **Clear error messages**: Make it obvious what went wrong
3. **Allow skip**: Accept `--no-verify` for emergencies
4. **Use with CI**: Hook for developers, CI as final check
5. **Share with team**: Commit `.githooks/` to the repo
