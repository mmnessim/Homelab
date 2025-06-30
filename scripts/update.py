# Python version of update-containers.sh

import os

paths = [
    "/home/mounir/compose/portainer",
    "/home/mounir/compose/filebrowser",
    "/home/mounir/compose/ntfy",
    "/home/mounir/mnt/drive/immich",
]

for path in paths:
    if os.path.exists(path):
        print(f"Updating {path}...")
        os.system(f"cd {path} && docker compose stop && docker compose pull && docker compose up -d")

    else:
        print(f"Path {path} does not exist, skipping update.")
