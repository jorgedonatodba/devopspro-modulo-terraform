terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "ssh" {
  name       = "devopspro"
  public_key = file("~/.ssh/id_ed25519.pub")
}

module "wp_stack" {
  source = "./modules/do_wp_stack"

  region =  var.region
  wp_vm_count = var.wp_vm_count
  vms_ssh = digitalocean_ssh_key.ssh.fingerprint
}