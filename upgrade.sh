#!/bin/bash

# Define the string to search for and the replacement string
search_string="foodics-interview:airports"
replace_string="foodics-interview:airports1"

# Input file
input_file="docker-compose.yml"

# Perform the replacement on the first occurrence only
if [ -f "$input_file" ]; then
    sed "0,/$search_string/s//$replace_string/" "$input_file"
    docker-compose up -d
else
  echo "Input file '$input_file' not found."
fi
