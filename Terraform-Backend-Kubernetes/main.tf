terraform {
  backend "kubernetes" {
    secret_suffix    = "state"
    config_path      = "~/.kube/config"
  }
}


resource "local_file" "arquivo_local" {
  content  = "Conteúdo"
  filename = "./arquivo.txt"
}
