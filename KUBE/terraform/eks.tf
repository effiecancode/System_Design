resource "aws_eks_cluster" "app_cluster" {
    name = "app-api-cluster"
    role_arn = aws_iam_role.eks_role.arn

    vpc_config {
      subnet_ids = [aws_subnet.subnet.id, aws_subnet.subnet2.id]
    }
}