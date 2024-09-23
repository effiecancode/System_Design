# Kubernetes provider configuration
provider "kubernetes" {
  host                   = aws_eks_cluster.helloworld_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.helloworld_cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.helloworld_cluster.name]
    command     = "aws"
  }
}

# kubernetes deployment
resource "kubernetes_deployment" "helloworld" {
  metadata {
    name = "helloworld-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "helloworld"
      }
    }

    template {
      metadata {
        labels = {
          app = "helloworld"
        }
      }

      spec {
        container {
          image = "${aws_ecr_repository.helloworld_repo.repository_url}:latest"
          name  = "helloworld-container"

          port {
            container_port = 8000
          }
        }
      }
    }
  }
}

 # kubernetes service
 resource "kubernetes_service" "helloworld" {
  metadata {
    name = "helloworld-service"
  }

  spec {
    selector = {
      app = "helloworld"
    }

    port {
      port        = 8000
      target_port = 8000
    }

    type = "ClusterIP"
  }
}
