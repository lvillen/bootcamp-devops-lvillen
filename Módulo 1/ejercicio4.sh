#!/bin/bash

URL="https://en.wikipedia.org/wiki/J._R._R._Tolkien"

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Error: missing arguments."
  exit 1
fi

# Word the user provided
WORD=$1

# Move curl output to temp directory
TEMP_FILE=$(mktemp)
curl -s "$URL" > "$TEMP_FILE"

# Count how many times the word appears in the file
COUNT=$(grep -o -i "$WORD" "$TEMP_FILE" | wc -l | xargs)

if [ "$COUNT" -eq 0 ]; then
  echo "Couldn't find the word \"$WORD\""
else
  # Get the first line where the word appears
  FIRST_LINE=$(grep -n -i "$WORD" "$TEMP_FILE" | head -n 1 | cut -d: -f1)
  echo "La palabra \"$WORD\" aparece $COUNT veces"
  echo "Aparece por primera vez en la línea $FIRST_LINE"
fi

# Clean up
rm "$TEMP_FILE"
