output "vm_id" {
  description = "ID utworzonej maszyny"
  value       = proxmox_virtual_environment_vm.rocky9.vm_id
}

output "ssh_command" {
  description = "Gotowa komenda do zalogowania się"
  value       = "ssh ${var.user_name}@${split("/", var.ip_address)[0]}"
}
