variable "droplet_name" {
  default     = "vm-aula"
  type        = string
  description = "1"
}

variable "droplet_region" {
  default     = "nyc1"
  type        = string
  description = "2"
}

variable "droplet_size" {
  default     = "s-4vcpu-8gb"
  type        = string
  description = "3"
}

variable "sshkey_name" {
  default     = "devopspro"
  type        = string
  description = "4"
}

variable "do_token" {
  type        = string
  description = "5"
}

variable "vms_count" {
  default     = 1
  type        = number
  description = "6"
}