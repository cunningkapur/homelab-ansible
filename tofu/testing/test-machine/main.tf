# 2) Maszyna wirtualna.
resource "proxmox_virtual_environment_vm" "rocky9" {
  node_name   = var.node_name
  vm_id       = var.vm_id
  name        = var.vm_name
  description = "Zarządzane przez OpenTofu"
  tags        = ["tofu"]

  # Bez qemu-guest-agent przy destroy po prostu zatrzymaj maszynę.
  stop_on_destroy = true

  agent {
    enabled = false
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = 2
    # Rocky 9 wymaga x86-64-v2, na domyślnym CPU nie wystartuje.
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048 # MB
  }

  disk {
    datastore_id = var.vm_datastore
    # Odwołanie do innego zasobu: OpenTofu najpierw pobierze obraz.
    import_from   = "local:import/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
    interface = "virtio0"
    size      = 20 # GB
  }

  network_device {
    bridge = var.bridge
  }

  # Logi startu w konsoli Proxmoxa.
  serial_device {}

  # cloud-init: konfiguracja przy pierwszym starcie.
  initialization {
    datastore_id = var.vm_datastore

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.dns_server]
    }

    user_account {
      username = var.user_name
      keys     = [trimspace(file(pathexpand(var.ssh_public_key_path)))]
    }
  }
}
