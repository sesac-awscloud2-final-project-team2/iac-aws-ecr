data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "travelog_repo" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"  # 태그 변경 가능
  tags                 = {
    Environment = var.environment
    Project     = var.project_name
  }
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = var.kms_key_arn 
  }
}

resource "aws_ecr_repository_policy" "travelog_repo_policy" {
  repository = aws_ecr_repository.travelog_repo.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowPushPull"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
      }
    ]
  })
}