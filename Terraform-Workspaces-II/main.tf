resource "local_file" "arquivo" {
  content  = local.lconteudo
  filename = "arquivo-${terraform.workspace}.txt"
}

variable "conteudo" {
  default = "Conteúdo do Arquivo"
  type        = string
  description = "Conteúdo do Arquivo"
}

locals {
  lconteudo = "${var.conteudo} - Workspace - ${terraform.workspace}"
}

