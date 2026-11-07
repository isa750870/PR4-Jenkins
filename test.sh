#!/bin/sh
set -eu

FILE="build/index.html"

if [ ! -s "$FILE" ]; then
    echo "ERROR: build/index.html is missing or empty"
    exit 1
fi

grep -Fq '<!DOCTYPE html>' "$FILE"
grep -Fq '<meta name="project" content="ProizvodstvoPro">' "$FILE"
grep -Fq '<meta name="variant" content="10">' "$FILE"
grep -Fq '</html>' "$FILE"

cmp -s index.html "$FILE"

echo "All tests passed"