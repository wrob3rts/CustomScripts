#!/bin/bash
set -e

get_base_name() {
    filename="$1"
    basename=$(basename "$filename")
    basename="${basename%.tar.gz}"
    basename="${basename%.tgz}"
    basename="${basename%.tar.bz2}"
    basename="${basename%.tar.xz}"
    basename="${basename%.tar.zst}"
    basename="${basename%.tar.lz}"
    basename="${basename%.tar}"
    echo "$basename"
}

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <tarball> <output_dir>"
    exit 1
fi

archive="$1"
output_dir="$2"

if [[ ! -f "$archive" ]]; then
    echo "File not found: $archive"
    exit 1
fi

if [[ ! -d "$output_dir" ]]; then
    echo "Directory not found: $output_dir"
    exit 1
fi

dirname=$(get_base_name "$archive")
target="$output_dir/$dirname"

mkdir -p "$target"
echo "Unpacking '$archive' into '$target'"
tar -xf "$archive" -C "$target"

