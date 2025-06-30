#! /bin/bash

# This script updates all Docker containers on VM 111

paths=(
    "/home/mounir/homepage"
    "/home/mounir/bookstack"
)

for path in "${paths[@]}"; do
    echo "Updating containers in $path"
    cd "$path" || { echo "Failed to change directory to $path"; continue; }

    # Pull the latest images and recreate containers
    docker compose stop && docker compose pull && docker compose up -d --remove-orphans

    if [ $? -eq 0 ]; then
        echo "Successfully updated containers in $path"
    else
        echo "Failed to update containers in $path"
    fi
done
