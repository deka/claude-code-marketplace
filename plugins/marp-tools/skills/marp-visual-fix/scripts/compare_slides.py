#!/usr/bin/env python3
"""
Marp slide image comparison script

Compares before/after images and detects differences.
Uses ImageMagick's composite command.

Usage:
    python compare_slides.py <before_image> <after_image> [threshold]

Example:
    python compare_slides.py before.001.png after.001.png
    python compare_slides.py before.001.png after.001.png 0.01
"""

import subprocess
import sys
from pathlib import Path


def compare_images(before_path: str, after_path: str, threshold: float = 0.001) -> dict:
    """
    Compare two images and return the difference level.

    Args:
        before_path: Path to source image
        after_path: Path to target image
        threshold: Acceptable difference threshold (0.0-1.0)

    Returns:
        Dictionary containing comparison result
    """
    before = Path(before_path)
    after = Path(after_path)

    if not before.exists():
        return {"error": f"File not found: {before}"}
    if not after.exists():
        return {"error": f"File not found: {after}"}

    try:
        # Compute diff with ImageMagick
        result = subprocess.run(
            [
                "composite",
                "-compose", "difference",
                str(before),
                str(after),
                "-"
            ],
            capture_output=True,
            check=True
        )

        # Get mean value from diff image
        identify_result = subprocess.run(
            [
                "identify",
                "-format", "%[mean]",
                "-"
            ],
            input=result.stdout,
            capture_output=True,
            check=True
        )

        mean_diff = float(identify_result.stdout.decode().strip())

        # Normalize to percentage (16-bit = 65535)
        normalized_diff = mean_diff / 65535.0

        return {
            "before": str(before),
            "after": str(after),
            "difference": normalized_diff,
            "threshold": threshold,
            "passed": normalized_diff < threshold,
            "message": "No diff" if normalized_diff < threshold else f"Diff detected: {normalized_diff:.6f}"
        }

    except subprocess.CalledProcessError as e:
        return {"error": f"ImageMagick execution error: {e}"}
    except FileNotFoundError:
        return {"error": "ImageMagick is not installed. Run 'apt install imagemagick'."}


def compare_slide_sets(before_pattern: str, after_pattern: str, threshold: float = 0.001) -> list:
    """
    Compare multiple slide images.

    Args:
        before_pattern: Source file pattern (e.g. before.*.png)
        after_pattern: Target file pattern (e.g. after.*.png)
        threshold: Acceptable difference threshold

    Returns:
        List of comparison results for each slide
    """
    before_dir = Path(before_pattern).parent
    before_glob = Path(before_pattern).name

    before_files = sorted(before_dir.glob(before_glob))
    results = []

    for before_file in before_files:
        # Find corresponding after file
        after_file = Path(after_pattern.replace("*", before_file.stem.split(".")[-1]))

        if after_file.exists():
            result = compare_images(str(before_file), str(after_file), threshold)
            results.append(result)
        else:
            results.append({
                "before": str(before_file),
                "after": str(after_file),
                "error": "Corresponding file not found"
            })

    return results


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)

    before_path = sys.argv[1]
    after_path = sys.argv[2]
    threshold = float(sys.argv[3]) if len(sys.argv) > 3 else 0.001

    result = compare_images(before_path, after_path, threshold)

    if "error" in result:
        print(f"Error: {result['error']}")
        sys.exit(1)

    print(f"Source: {result['before']}")
    print(f"Target: {result['after']}")
    print(f"Difference: {result['difference']:.6f}")
    print(f"Threshold: {result['threshold']}")
    print(f"Result: {'✓ Pass' if result['passed'] else '✗ Fail'}")

    sys.exit(0 if result['passed'] else 1)


if __name__ == "__main__":
    main()
