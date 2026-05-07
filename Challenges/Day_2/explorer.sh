#!/usr/bin/env bash

SIZES=(
  "B"
  "KB"
  "MB"
  "GB"
)
INDEX=0
NUMCHARS=0

make_readable() {
  INDEX=0
  while true; do
    if (( BYTES > 1000 )); then
      BYTES=$(( BYTES/1000 ))
      ((INDEX++))
    else
      break
    fi
  done
}

echo 'Welcome to the Interactive File and Directory Explorer!'
echo -e "\nFiles and Directories in the Current Path:"

for file in *; do
  BYTES=$(stat -c '%s' $file)
  make_readable
  echo -n '- '
  printf '%s (%d %s)\n' "$file" "$BYTES" "${SIZES[$INDEX]}" 
done
while read -p "Enter a line of text (Enter without text to exit): " line; do
  if [[ -z "$line" ]]; then
    break
  fi
  size=${#line}
  NUMCHARS=$(( NUMCHARS += size ))
done
echo "Character Count: $NUMCHARS"

