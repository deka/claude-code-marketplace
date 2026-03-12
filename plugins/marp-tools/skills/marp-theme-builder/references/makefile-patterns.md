# Marp Theme Makefile Structure Patterns

## Table of Contents

- [Basic Structure](#basic-structure)
- [Dependencies](#dependencies)
- [Variable Design](#variable-design)
- [Target Patterns](#target-patterns)
- [Adding Help](#adding-help)
- [CI Configuration](#ci-configuration)
- [Error Handling](#error-handling)

## Basic Structure

```makefile
# Path definitions
CSS_PATH      = ./marp-themes/theme.css
SCSS_PATH     = ./marp-themes/theme.scss
SRC_PATH      = ./example/example.md
DST_BASE_PATH = ./example/example.png
DST_PATH      = ./example/example.001.png ./example/example.002.png

# Default target
all: $(DST_PATH)

# Initialize
init:
	git config core.hooksPath .githooks
	npm install -g sass

# Image generation (depends on CSS and MD)
$(DST_PATH): $(CSS_PATH) $(SRC_PATH)
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --output $(DST_BASE_PATH) \
	  --theme-set $(CSS_PATH) \
	  --images png

# CSS compile (depends on SCSS)
$(CSS_PATH): $(SCSS_PATH)
	sass $(SCSS_PATH) $(CSS_PATH)

# Watch mode
csswatch:
	sass --watch $(SCSS_PATH) $(CSS_PATH)

marpwatch:
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --watch \
	  --output $(DST_BASE_PATH) \
	  --theme-set $(CSS_PATH) \
	  --images png

# Clean
clean:
	rm -f $(CSS_PATH) $(DST_PATH)

.PHONY: all init csswatch marpwatch clean
```

## Dependencies

```
SCSS ──────> CSS ──────> PNG images
  │           │            │
  │           │            │
  └───────────┴────────────┘
              │
           make all
```

## Variable Design

### Multiple themes

```makefile
THEMES = theme1 theme2 theme3
CSS_FILES = $(patsubst %,marp-themes/%.css,$(THEMES))
SCSS_FILES = $(patsubst %,marp-themes/%.scss,$(THEMES))

all: $(CSS_FILES) images

marp-themes/%.css: marp-themes/%.scss
	sass $< $@
```

### Environment variables

```makefile
SASS_CMD ?= sass
MARP_CMD ?= npx @marp-team/marp-cli@latest

$(CSS_PATH): $(SCSS_PATH)
	$(SASS_CMD) $(SCSS_PATH) $(CSS_PATH)
```

## Target Patterns

### Init target

```makefile
init:
	@echo "Initializing project..."
	git config core.hooksPath .githooks
	npm install -g sass
	@echo "Done"
```

### Build target

```makefile
build: css images
	@echo "Build complete"

css: $(CSS_PATH)

images: $(DST_PATH)
```

### Development target

```makefile
dev:
	@echo "Starting dev mode (Ctrl+C to exit)"
	@make csswatch & make marpwatch

serve:
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --theme-set $(CSS_PATH) \
	  --server
```

### Test target

```makefile
test: clean build
	@echo "Build test complete"

lint:
	npx stylelint "marp-themes/**/*.scss"
```

### Clean target

```makefile
clean:
	rm -f $(CSS_PATH) $(CSS_PATH).map
	rm -f example/example.*.png

distclean: clean
	rm -rf node_modules
```

## Adding Help

```makefile
.DEFAULT_GOAL := help

help:
	@echo "Available targets:"
	@echo "  make init      - Initial setup"
	@echo "  make           - Run build"
	@echo "  make csswatch  - SCSS watch mode"
	@echo "  make marpwatch - Slide watch mode"
	@echo "  make clean     - Remove generated files"
```

## CI Configuration

```makefile
CI ?= false

ifeq ($(CI),true)
MARP_FLAGS = --allow-local-files
else
MARP_FLAGS =
endif

$(DST_PATH): $(CSS_PATH) $(SRC_PATH)
	npx @marp-team/marp-cli@latest \
	  $(SRC_PATH) \
	  --output $(DST_BASE_PATH) \
	  --theme-set $(CSS_PATH) \
	  --images png \
	  $(MARP_FLAGS)
```

## Error Handling

```makefile
$(CSS_PATH): $(SCSS_PATH)
	@if ! command -v sass > /dev/null; then \
		echo "sass is not installed. Run make init."; \
		exit 1; \
	fi
	sass $(SCSS_PATH) $(CSS_PATH)
```
