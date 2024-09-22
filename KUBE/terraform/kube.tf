resource "kubernetes_deployment" "api" {
  metadata {
    name      = "app-api"
    namespace = "default"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "app-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "app-api"
        }
      }

      spec {
        container {
          name  = "app-api"
          image = "my_ecr_repo"

          port {
            container_port = 8000
          }
        }
      }
    }
  }
}
