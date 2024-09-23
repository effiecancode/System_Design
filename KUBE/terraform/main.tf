# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create an ECR repository
resource "aws_ecr_repository" "helloworld_repo" {
  name                 = "helloworld"
  image_tag_mutability = "MUTABLE"
}

# Create an EKS cluster
resource "aws_eks_cluster" "helloworld_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.helloworld_cluster_role.arn

  vpc_config {
    subnet_ids = aws_subnet.private[*].id
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.helloworld_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.helloworld_cluster_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.helloworld_cluster_AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "helloworld_node_group" {
  cluster_name    = aws_eks_cluster.helloworld_cluster.name
  node_group_name = "helloworld-node-group"
  node_role_arn   = aws_iam_role.helloworld_worker_node_role.arn
  subnet_ids      = aws_subnet.private[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.helloworld_worker_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.helloworld_worker_node_AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "helloworld_cluster_role" {
  name = "${var.cluster_name}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "helloworld_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.helloworld_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "helloworld_cluster_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.helloworld_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "helloworld_cluster_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.helloworld_cluster_role.name
}

resource "aws_iam_role" "helloworld_worker_node_role" {
  name = "${var.cluster_name}-eks-worker-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "helloworld_worker_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.helloworld_worker_node_role.name
}

resource "aws_iam_role_policy_attachment" "helloworld_worker_node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.helloworld_worker_node_role.name
}
