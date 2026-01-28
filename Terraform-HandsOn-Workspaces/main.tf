terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.74.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name     = "${var.k8s_name}-${terraform.workspace}"
  vpc_uuid = var.k8s_vpc_uuid
  region   = var.region
  # Grab the latest version slug from `doctl kubernetes options versions` (e.g. "1.14.6-do.1"
  # If set to "latest", latest published version will be used.
  version = var.k8s_version

  node_pool {
    name       = var.k8s_node_pool_name
    size       = var.k8s_node_size
    node_count = var.k8s_node_pool_count
  }

    lifecycle {
      prevent_destroy = false
    }

}

variable "do_token" {
  type = string
}

variable "region" {
  type    = string
  default = "nyc1"
}

variable "k8s_version" {
  type    = string
  default = "1.34.1-do.3"
}

variable "k8s_name" {
  type    = string
  default = "k8s-aula"
}

variable "k8s_vpc_uuid" {
  type    = string
  default = "86aad37e-b23c-42f0-ae50-f507d579de68"
}

variable "k8s_node_size" {
  type    = string
  default = "s-2vcpu-2gb"
}

variable "k8s_node_pool_name" {
  type    = string
  default = "pool-24nmct3fo"
}

variable "k8s_node_pool_count" {
  type    = number
  default = 2
}