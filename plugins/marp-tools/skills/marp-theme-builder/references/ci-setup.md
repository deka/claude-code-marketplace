# Marp Theme GitHub Actions CI Setup

## Table of Contents

- [Basic Workflow](#basic-workflow)
- [Image Diff Test Details](#image-diff-test-details)
- [PR Comment](#pr-comment)
- [Matrix Build](#matrix-build)
- [Cache Setup](#cache-setup)
- [Conditional Execution](#conditional-execution)
- [Slack Notification](#slack-notification)
- [Release Workflow](#release-workflow)

## Basic Workflow

```yaml
name: Theme build test

on:
  push:
    branches: [main]
  pull_request:
    types: [opened, synchronize, reopened]
  workflow_dispatch:

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install sass
        run: npm install -g sass

      - name: Backup committed images
        run: |
          mkdir -p backup
          cp example/example.*.png backup/ 2>/dev/null || true

      - name: Clean build
        run: make clean all

      - name: Image diff check
        run: |
          for file in backup/*.png; do
            if [ -f "$file" ]; then
              name=$(basename "$file")
              result="$(composite -compose difference \
                "example/$name" \
                "$file" \
                - | \
                identify -format '%[mean]' -)"
              if (( $(echo "$result > 0.001 * 65535" | bc -l) )); then
                echo "Diff detected: $name ($result)"
                exit 1
              fi
            fi
          done
          echo "All images match"

      - name: Save build artifacts
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: example-slides
          path: example/
          retention-days: 7
```

## Image Diff Test Details

### Diff detection with ImageMagick

```yaml
- name: Image diff check
  run: |
    THRESHOLD=0.001

    compare_images() {
      local orig="$1"
      local gen="$2"

      result="$(composite -compose difference "$gen" "$orig" - | \
        identify -format '%[mean]' -)"

      # Normalize for 16-bit image
      normalized=$(echo "scale=10; $result / 65535" | bc)

      if (( $(echo "$normalized > $THRESHOLD" | bc -l) )); then
        echo "FAIL: $(basename $orig) - diff: $normalized"
        return 1
      else
        echo "PASS: $(basename $orig) - diff: $normalized"
        return 0
      fi
    }

    failed=0
    for backup_file in backup/*.png; do
      if [ -f "$backup_file" ]; then
        name=$(basename "$backup_file")
        if ! compare_images "$backup_file" "example/$name"; then
          failed=1
        fi
      fi
    done

    exit $failed
```

## PR Comment

```yaml
- name: Show build result on PR
  if: github.event_name == 'pull_request'
  uses: actions/github-script@v7
  with:
    script: |
      const fs = require('fs');
      const path = require('path');

      // Find image files
      const exampleDir = './example';
      const images = fs.readdirSync(exampleDir)
        .filter(f => f.endsWith('.png'))
        .sort();

      let body = '## Slide Preview\n\n';

      for (const img of images) {
        body += `### ${img}\n`;
        body += `Please verify appearance.\n\n`;
      }

      body += '\n---\n*Auto-generated comment*';

      github.rest.issues.createComment({
        issue_number: context.issue.number,
        owner: context.repo.owner,
        repo: context.repo.repo,
        body: body
      });
```

## Matrix Build

```yaml
jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest]
        node: ['18', '20']

    runs-on: ${{ matrix.os }}

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      # ...
```

## Cache Setup

```yaml
- name: npm cache
  uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-npm-
```

## Conditional Execution

```yaml
- name: Build only when theme files change
  if: |
    contains(github.event.head_commit.modified, 'marp-themes/') ||
    contains(github.event.head_commit.modified, 'example/')
  run: make all
```

## Slack Notification

```yaml
- name: Slack notification (on failure)
  if: failure()
  uses: slackapi/slack-github-action@v1
  with:
    payload: |
      {
        "text": "⚠️ Marp theme build failed: ${{ github.repository }}"
      }
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

## Release Workflow

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Build
        run: |
          npm install -g sass
          make all

      - name: Create release assets
        run: |
          mkdir -p dist
          cp marp-themes/*.css dist/
          tar czf theme-${{ github.ref_name }}.tar.gz dist/

      - name: Create GitHub release
        uses: softprops/action-gh-release@v1
        with:
          files: theme-*.tar.gz
```
