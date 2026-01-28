terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_service_v1" "web_page_service" {
  metadata {
    name = "web-page"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.web_page.spec.0.template.0.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_deployment_v1" "web_page" {
  metadata {
    name = "web-page"
  }

  spec {
    replicas = 5

    selector {
      match_labels = {
        app = "web-page"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-page"
        }
      }

      spec {
        container {
          image = "kubedevio/web-page:green"
          name  = "web-page"
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "web_page_ingress" {
  metadata {
    name = "web-page"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "web.165.245.152.94.nip.io"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.web_page_service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}