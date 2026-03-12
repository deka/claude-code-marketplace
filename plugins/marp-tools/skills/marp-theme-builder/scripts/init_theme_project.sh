#!/bin/bash
#
# Marp theme project initialization script
#
# Usage:
#   ./init_theme_project.sh <project_name> [theme_name]
#
# Examples:
#   ./init_theme_project.sh my-company-theme
#   ./init_theme_project.sh my-company-theme company

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <project_name> [theme_name]"
    exit 1
fi

PROJECT_NAME="$1"
THEME_NAME="${2:-${PROJECT_NAME}}"

echo "Creating project: $PROJECT_NAME (theme name: $THEME_NAME)"

# Create directories
mkdir -p "$PROJECT_NAME"/{.github/workflows,.githooks,marp-themes,example}
cd "$PROJECT_NAME"

# Initialize Git
git init

# Create README
cat > README.md << EOF
# $PROJECT_NAME

Marp presentation theme.

## Setup

\`\`\`bash
make init
\`\`\`

## Build

\`\`\`bash
make
\`\`\`

## Development

\`\`\`bash
# Watch for SCSS changes
make csswatch

# Auto-regenerate slide images (in another terminal)
make marpwatch
\`\`\`

## Theme Usage

Specify in Markdown frontmatter:

\`\`\`yaml
---
marp: true
theme: $THEME_NAME
---
\`\`\`
EOF

# Create Makefile
cat > Makefile << 'EOF'
CSS_PATH      = ./marp-themes/theme.css
SCSS_PATH     = ./marp-themes/theme.scss
SRC_PATH      = ./example/example.md
DST_BASE_PATH = ./example/example.png
DST_PATH      = ./example/example.001.png

all: $(DST_PATH)

init:
	git config core.hooksPath .githooks
	npm install -g sass

$(DST_PATH): $(CSS_PATH) $(SRC_PATH)
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --output $(DST_BASE_PATH) \
	  --theme-set $(CSS_PATH) \
	  --images png

marpwatch:
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --watch \
	  --output $(DST_BASE_PATH) \
	  --theme-set $(CSS_PATH) \
	  --images png

$(CSS_PATH): $(SCSS_PATH)
	sass $(SCSS_PATH) $(CSS_PATH)

csswatch:
	sass --watch $(SCSS_PATH) $(CSS_PATH)

clean:
	rm -f $(CSS_PATH) $(DST_PATH)

.PHONY: all init marpwatch csswatch clean
EOF

# Minimal theme SCSS
cat > marp-themes/theme.scss << EOF
/*!
 * @theme $THEME_NAME
 * @auto-scaling true
 * @size 16:9 1280px 720px
 * @size 4:3 960px 720px
 */

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');

section {
  background-color: white;
  color: #333;
  font-family: 'Noto Sans JP', sans-serif;
  font-size: 28px;
  padding: 40px 50px;
  width: 1280px;
  height: 720px;
}

h1, h2, h3 {
  color: #003981;
}

section.lead {
  display: flex;
  flex-direction: column;
  justify-content: center;
  background: linear-gradient(135deg, #003981, #005ea5);
  color: white;

  h1 { color: white; text-align: center; }
}
EOF

# Sample slides
cat > example/example.md << EOF
---
marp: true
theme: $THEME_NAME
paginate: true
---

<!--
_class: lead
-->

# $THEME_NAME Theme

Sample presentation

---

# Heading Sample

## h2 Heading
### h3 Heading

Regular text.

---

# Bullet Points

- Item 1
- Item 2
- Item 3

1. Numbered 1
2. Numbered 2
EOF

# pre-commit hook
cat > .githooks/pre-commit << 'EOF'
#!/bin/sh

build_result=$(make)
build_rc=$?
if [ $build_rc -ne 0 ] ; then
    echo "git pre-commit check failed: build failed."
    exit 1
fi
EOF
chmod +x .githooks/pre-commit

# GitHub Actions
cat > .github/workflows/test.yml << 'EOF'
name: Theme build test

on:
  push:
    branches: [main]
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install sass
        run: npm install -g sass
      - name: Backup images
        run: mkdir backup && mv example/example.*.png backup/ 2>/dev/null || true
      - name: Build
        run: make clean all
      - name: Image diff check
        run: |
          if [ -f backup/example.001.png ]; then
            result="$(composite -compose difference example/example.001.png backup/example.001.png - | identify -format '%[mean]' -)"
            (( $(echo "0.001 > $result" | bc -l) )) || exit 1
          fi
      - name: Save artifacts
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: example-slides
          path: example/
EOF

# .gitignore
cat > .gitignore << 'EOF'
*.css.map
node_modules/
.DS_Store
EOF

echo ""
echo "Project created: $PROJECT_NAME"
echo ""
echo "Next steps:"
echo "  cd $PROJECT_NAME"
echo "  make init"
echo "  make"
