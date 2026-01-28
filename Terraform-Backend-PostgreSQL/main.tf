terraform {
  backend "pg" {
    conn_str = "postgres://vagrant:vagrant@192.168.56.39:5432/terraform_state"
  }
}


resource "local_file" "arquivo_local" {
  content  = "Conteúdo"
  filename = "./arquivo.txt"
}
