#!/bin/bash

# Default output directory is current directory
output_dir="."

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output)
            output_dir="$2"
            shift 2
            ;;
        *)
            language="$1"
            shift
            ;;
    esac
done

# Check if language was provided
if [ -z "$language" ]; then
    echo "Error: Programming language argument is required"
    echo "Usage: $0 <language> [-o|--output <directory>]"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Make API request
response=$(curl -s -w "%{http_code}" "https://www.toptal.com/developers/gitignore/api/$language")
http_code=${response: -3}
content=${response:0:${#response}-3}

if [ "$http_code" -eq 200 ]; then
    gitignore_path="$output_dir/.gitignore"
    
    # If .gitignore exists, append with a header
    if [ -f "$gitignore_path" ]; then
        echo -e "\n# Added $language gitignore rules\n" >> "$gitignore_path"
        echo "$content" >> "$gitignore_path"
        echo "Added $language rules to existing .gitignore at $gitignore_path"
    else
        echo "$content" > "$gitignore_path"
        echo "Created new .gitignore at $gitignore_path"
    fi
else
    echo "Error: Failed to fetch gitignore template for $language (HTTP $http_code)"
    exit 1
fi
