variable "region" {
  type    = string
  default = "nyc1"
}

variable "wp_vm_count" {
  type    = number
  default = 2

  validation {
    condition = var.wp_vm_count > 1
    error_message = "Erro"
  }
}

variable "vms_ssh" {
  type    = string
}