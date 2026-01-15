resource "local_file" "foo" {
  content  = file("./main.tf")
  filename = "./arquivo.txt"
}
