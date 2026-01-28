terraform {
  backend "local" {
    path = "./estado-do-projeto.tfstate"
  }
}

resource "local_file" "arquivo_local" {
  content  = "Conteúdo"
  filename = "./arquivo.txt"
}
