variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS cluster"
  default     = "1.21"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}
