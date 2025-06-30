# Scripts

This folder has a bunch of scripts to run on new/old VMs. Almost every VM should run `setup.sh` which installs some of my most used things like Docker, Tailscale, and Vim.

## Each script

* `setup.sh` - install basic utilities
* `vim.sh` - just Vim installation and plugin setup (included in `setup.sh`)
* `update-containers-{VMID}.sh` - stop, pull, and up for each docker container on that VM
    * I'd like to update these scripts to use some kind of config file and not need a separate one for each VM
