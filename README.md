# homelab-ansible
Repo purpose:

Storing homelab configuration as a code to easily rebuild and modify.

Goals:
    - opentofu practice
    - refinement of ansible1 repository:
        - roles
        - templates
        - tbd
    - rebuilding homelab infrastructure, with following features:
        - machines access internet via virtual router/ firewall
        - all vms added to local dns server, building new machines adds dns entries
        - admin access to vms through separate network
        - some monitoring tools (tbd)
        - hosting backup sevices and storage for other users in local network
        - more servies for personal use (tbd)
