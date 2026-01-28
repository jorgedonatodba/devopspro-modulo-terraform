output "droplet_ip" {
  value = digitalocean_droplet.vm_aula.ipv4_address
}

output "droplet_id" {
  value = digitalocean_droplet.vm_aula.id
}