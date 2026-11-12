terraform {
  required_providers {
    # "proxmox" to lokalna nazwa. Od niej zaczynają się nazwy zasobów.
    proxmox = {
      source = "bpg/proxmox" # = registry.opentofu.org/bpg/proxmox
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint

  # self-signed certificate
  insecure = true

  # uses PROXMOX_VE_API_TOKEN.

  
}
