variable "proxmox_endpoint" {
  description = "Adres API Proxmoxa, np. https://192.168.1.10:8006/"
  type        = string
}

variable "node_name" {
  description = "Nazwa węzła Proxmox (domyślnie 'pve')"
  type        = string
  default     = "pmx"
}

variable "image_datastore" {
  description = "Storage na pobrany obraz (musi mieć włączone 'ISO image')"
  type        = string
  default     = "local"
}

variable "vm_datastore" {
  description = "Storage na dysk maszyny"
  type        = string
  default     = "local-lvm"
}

variable "vm_id" {
  description = "ID maszyny, którego jeszcze nie używasz"
  type        = number
  default     = 900
}

variable "vm_name" {
  description = "Nazwa maszyny"
  type        = string
  default     = "tofu-test"
}

variable "bridge" {
  description = "Mostek sieciowy"
  type        = string
  default     = "vmbr0"
}

variable "ip_address" {
  description = "Statyczny IP z maską, np. 192.168.1.50/24 (musi być wolny!)"
  type        = string
}

variable "gateway" {
  description = "Brama domyślna, np. 192.168.1.1"
  type        = string
}

variable "dns_server" {
  description = "Serwer DNS"
  type        = string
  default     = "192.168.1.203"
}

variable "ssh_public_key_path" {
  description = "Ścieżka do Twojego publicznego klucza SSH"
  type        = string
  default     = "~/.ssh/ansiblekey.pub"
}
variable "user_name" {
  description = "non-root user name"
  type        = string
  default     = "ansible"
}
