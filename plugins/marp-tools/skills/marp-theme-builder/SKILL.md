---
name: marp-theme-builder
description: Build Marp theme pipelines. Supports SCSS→CSS compilation, sample image generation, Makefile setup, Git hooks, and GitHub Actions CI. Use when requests include "set up theme build environment", etc.
---

# Marp Theme Builder Skill

Skill for building Marp theme pipelines.

## When to Use

- "Set up theme build environment"
- "Configure CI"
- "Create Makefile"
- "Set up pre-commit hook"
- "Add image diff testing"

## Workflow

1. **Project initialization**: Directory structure, package.json
2. **Makefile creation**: Define build commands
3. **Git hook setup**: Build check on pre-commit
4. **CI setup**: GitHub Actions workflow
5. **Verification**: Run build and tests

## Related Skills

- **marp-theme-creator**: Theme creation (build target)

## Scripts

- [init_theme_project.sh](scripts/init_theme_project.sh) - Project initialization
- [build.sh](scripts/build.sh) - Build execution
- [image_diff.py](scripts/image_diff.py) - Image diff detection

## References

- [makefile-patterns.md](references/makefile-patterns.md) - Makefile structure
- [ci-setup.md](references/ci-setup.md) - GitHub Actions setup
- [pre-commit-hook.md](references/pre-commit-hook.md) - Git hook setup

## Assets (Templates)

- [Makefile.template](assets/Makefile.template) - Makefile
- [test.yml.template](assets/test.yml.template) - GitHub Actions workflow
- [pre-commit.template](assets/pre-commit.template) - pre-commit hook

## Project Structure

```
my-marp-theme/
├── .github/
│   └── workflows/
│       └── test.yml        # CI config
├── .githooks/
│   └── pre-commit          # pre-commit hook
├── marp-themes/
│   ├── theme.scss          # Theme source
│   └── theme.css           # Generated CSS
├── example/
│   ├── example.md          # Sample slides
│   └── example.001.png     # Generated images
├── Makefile
├── package.json            # (optional)
└── README.md
```

## Build Flow

```
SCSS ─────> CSS ─────> PNG images
         (sass)    (marp-cli)
                      │
                      ▼
                   Git commit
                      │
                      ▼
                 pre-commit hook
                  (make)
                      │
                      ▼
                   CI (GitHub Actions)
                  (image diff test)
```

$ARGUMENTS
