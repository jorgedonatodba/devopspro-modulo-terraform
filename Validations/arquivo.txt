resource "local_file" "foo" {
  content  = file("./main.tf")
  filename = "./arquivo.txt"
}


variable "valor" {
  default = ["kubernetes","jenkins","qq bosta"]
  validation {
    condition = contains(var.valor,"kubernetes")
    error_message = "Deu ruim"
  }
}