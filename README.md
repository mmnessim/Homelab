# Homelab
Documentation for my Homelab including scripts, docker-compose.yml files, and other information.

## Lab Overview
As of right now, the setup consists of two machines running ProxMox as a hypervisor with a handful of Virtual Machines running on each:
* ProxMox PVE
    * VM 100 Debian Linux
        * Code-Server - VSCode in the browser
        * Personal website
        * Nginx Proxy Manager
        * Go-Chess-Picker - Personally developed webapp
        * Gitea - git respository management
    * VM 108 pfSense Firewall
    * VM 110 Debian Linux
        * Portainer - container management
        * Filebrowser
        * Immich - Photo and video storage
        * Weight Tracker - Python Flask webapp to track my weight
        * Flatnotes - Notetaking
    * VM 106 Windows Server 2025 - Trial Edition
        * Active Directory and server management practice
* ProxMox PVE2
    * VM 111 Debian Linux
        * Homepage - dashboard
        * Bookstack - knowledge base and documentation
    * VM 112 Debian Linux
        * Ollama and Webui - locally hosted LLMs

All Virtual Machines are connected to the same Tailscale Tailnet for secure remote access.

## Services
I chose services to run that provide some kind of practical benefit to me. For the most part, I have used the default `docker-compose.yml` template provided in each of their repos, but some have needed additional configuration. There are also a few little webapps that I have coded myself and written Dockerfiles. At the moment, those include my portfolio website, Go-Chess-Picker, and my Python weight tracker.

## Machines
The two physical machines I am using are a used Lenovo Thinkcetre desktop and an old Razer Blade laptop that had been at the bottom of my closet for some years.
