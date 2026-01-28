resource "local_file" "arquivo" {
  content = random_pet.pets.id
  filename = "arquivo.txt"
  }

resource "random_pet" "pets" {
  }
