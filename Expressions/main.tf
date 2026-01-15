resource "local_file" "foo" {
  content  = var.valor01 >= 10 ? "Maior" : "Menor"
  filename = "./arquivo.txt"
}

resource "local_file" "foo2" {
  content  = join(", ", [for v in var.valor02: trimspace(v)] )
  filename = "./arquivo2.txt"
}

var.saida  = join(", ", [for v in var.valor02: trimspace(v)] )

variable "valor01" {
  default = 9
}

variable "valor02" {
  default = ["    docker   ","   jenkins   ","     ansible    "]
}

output "op_valor" {
  value = local_file.foo2.content
}

variable "saida01" {
  default = []
}