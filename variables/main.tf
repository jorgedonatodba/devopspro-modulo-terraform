resource "local_file" "foo" {
  content  = "Blabla ${var.conteudo.regiao}"
  filename = "./arquivo.txt"
}

resource "random_pet" "pet01" {
}

variable "conteudo" {
  default = {
    regiao        = "nyc1",
    opcao_maquina = "s-1vcpu-2gb",
    fazer_bkp     = false
  }
  type        = object({ regiao = string, opcao_maquina = string, fazer_bkp = bool })
  description = "blabla"
}