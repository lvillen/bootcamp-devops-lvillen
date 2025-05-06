#!/bin/bash

# Create structure
mkdir -p foo/dummy foo/empty

# Create text file that accepts an argument
echo ${1:-"Que me gusta la bash!!!!"} > foo/dummy/file1.txt

# And create a second empty text file
touch foo/dummy/file2.txt

# Copy the content of the first file to the second one
cat foo/dummy/file1.txt > foo/dummy/file2.txt && mv foo/dummy/file2.txt foo/empty/
