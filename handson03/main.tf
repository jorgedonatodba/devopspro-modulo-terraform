terraform {
  required_version = ">=0.13"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

# Create a new SSH key
resource "digitalocean_ssh_key" "rs_ssh_key" {
  name       = "devopspro"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "web" {
  image    = "ubuntu-22-04-x64"
  name     = "web-1"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.rs_ssh_key.fingerprint]
}