#!/usr/bin/env python3
"""
Marp theme image diff detection script

Used in CI to compare committed images with build output and
detect visual regressions.

Usage:
    python image_diff.py <original_dir> <generated_dir> [threshold]

Example:
    python image_diff.py backup/ example/ 0.001

Dependencies:
    - ImageMagick (composite, identify commands)
"""

import subprocess
import sys
from pathlib import Path
from typing import List, Tuple


def find_image_pairs(original_dir: Path, generated_dir: Path) -> List[Tuple[Path, Path]]:
    """
    Find image pairs to compare.

    Args:
        original_dir: Directory containing original images
        generated_dir: Directory containing generated images

    Returns:
        List of (original, generated) path tuples
    """
    pairs = []

    for orig_file in sorted(original_dir.glob("*.png")):
        gen_file = generated_dir / orig_file.name
        if gen_file.exists():
            pairs.append((orig_file, gen_file))

    return pairs


def compare_images(original: Path, generated: Path, threshold: float = 0.001) -> dict:
    """
    Compare two images and return the difference level.

    Args:
        original: Path to original image
        generated: Path to generated image
        threshold: Acceptable difference threshold

    Returns:
        Dictionary containing comparison result
    """
    try:
        # Compute diff with ImageMagick
        composite_result = subprocess.run(
            [
                "composite",
                "-compose", "difference",
                str(original),
                str(generated),
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
            input=composite_result.stdout,
            capture_output=True,
            check=True
        )

        mean_diff = float(identify_result.stdout.decode().strip())
        # Normalize for 16-bit images (65535)
        normalized_diff = mean_diff / 65535.0

        return {
            "original": str(original),
            "generated": str(generated),
            "difference": normalized_diff,
            "threshold": threshold,
            "passed": normalized_diff < threshold,
        }

    except subprocess.CalledProcessError as e:
        return {
            "original": str(original),
            "generated": str(generated),
            "error": f"ImageMagick execution error: {e}",
            "passed": False,
        }
    except FileNotFoundError:
        return {
            "original": str(original),
            "generated": str(generated),
            "error": "ImageMagick is not installed",
            "passed": False,
        }


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)

    original_dir = Path(sys.argv[1])
    generated_dir = Path(sys.argv[2])
    threshold = float(sys.argv[3]) if len(sys.argv) > 3 else 0.001

    if not original_dir.exists():
        print(f"Error: Directory not found: {original_dir}")
        sys.exit(1)

    if not generated_dir.exists():
        print(f"Error: Directory not found: {generated_dir}")
        sys.exit(1)

    pairs = find_image_pairs(original_dir, generated_dir)

    if not pairs:
        print("No image pairs found for comparison")
        sys.exit(0)

    print(f"Image diff check (threshold: {threshold})")
    print("=" * 60)

    all_passed = True
    for original, generated in pairs:
        result = compare_images(original, generated, threshold)

        if "error" in result:
            status = "✗ Error"
            detail = result["error"]
            all_passed = False
        elif result["passed"]:
            status = "✓ OK"
            detail = f"Diff: {result['difference']:.6f}"
        else:
            status = "✗ Diff detected"
            detail = f"Diff: {result['difference']:.6f} (threshold: {threshold})"
            all_passed = False

        print(f"{status} {original.name}")
        print(f"       {detail}")
        print()

    print("=" * 60)
    if all_passed:
        print("Result: All images match")
        sys.exit(0)
    else:
        print("Result: Differences detected")
        sys.exit(1)


if __name__ == "__main__":
    main()
