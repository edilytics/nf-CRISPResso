#!/bin/bash

# Define file paths
JSON_FILE="args.json"
OUTPUT_FILE="include_args.json"

curl https://raw.githubusercontent.com/pinellolab/CRISPResso2/refs/heads/master/CRISPResso2/args.json > $JSON_FILE

# Extract all "keys" values and format them as a JSON array
jq -r '[.CRISPResso_args | .[].keys[] | gsub("-"; "")]' "$JSON_FILE" > "$OUTPUT_FILE"

# Print confirmation message
echo "Keys list saved to $OUTPUT_FILE"

# Clean up
rm -rf $JSON_FILE