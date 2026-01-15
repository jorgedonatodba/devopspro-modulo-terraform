terraform {
  required_version = ">=0.13"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
  }
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "vm_aula" {
  image    = "ubuntu-22-04-x64"
  name     = "${var.droplet_name}-0${count.index + 1}"
  region   = var.droplet_region
  size     = var.droplet_size
  backups  = false
  ssh_keys = [data.digitalocean_ssh_key.sshkey.id]
  count    = var.vms_count

connection {
  type = "ssh"
  user = "root"
  private_key = file("~/.ssh/id_ed25519")
  host = digitalocean_droplet.vm_aula[count.index].ipv4_address
}

provisioner "remote-exec" {
  inline = [ 
    "apt update && apt install nginx -y && apt install curl -y && snap install docker"
   ]
}

}

resource "digitalocean_firewall" "firewall_aula" {
  name = "only-22-80-and-443"

  droplet_ids = digitalocean_droplet.vm_aula[*].id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "53"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
