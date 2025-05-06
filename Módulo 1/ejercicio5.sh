#!/bin/bash

URL="https://en.wikipedia.org/wiki/J._R._R._Tolkien"

# Check if the user provided enough arguments
if [[ $# -gt 2 ]]; then
  echo "Se necesitan únicamente dos parámetros para ejecutar este script."
  exit 1
elif [[ $# -lt 2 ]]; then
  echo "Se necesitan al menos dos parámetros para ejecutar este script."
  exit 1
fi

# Arrange inputs received
if [[ "$1" == http* ]]; then
  URL=$1
  WORD=$2
else
  URL=$2
  WORD=$1
fi

# Move curl output to temp directory
TEMP_FILE=$(mktemp)
curl -s "$URL" > "$TEMP_FILE"

# Count how many times the word appears in the file
COUNT=$(grep -o -i "$WORD" "$TEMP_FILE" | wc -l | xargs)

# Get the first line where the word appears
function find_line_number() {
  grep -n -i "$WORD" "$TEMP_FILE" | head -n 1 | cut -d: -f1
}

if [ "$COUNT" -eq 0 ]; then
  echo "Couldn't find the word \"$WORD\""
elif [ "$COUNT" -eq 1 ]; then
  echo "La palabra \"$WORD\" aparece $COUNT vez"
  echo "Aparece únicamente en la línea $(find_line_number)"
else
  echo "La palabra \"$WORD\" aparece $COUNT veces"
  echo "Aparece por primera vez en la línea $(find_line_number)"
fi

# Clean up
rm "$TEMP_FILE"
