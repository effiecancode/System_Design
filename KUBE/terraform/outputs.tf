output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks_cluster.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with your cluster"
  value       = base64decode(module.eks_cluster.cluster_certificate_authority_data)
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}
