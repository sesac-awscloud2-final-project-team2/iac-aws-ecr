variable "repository_name" {
  description = "ECR 리포지토리 이름"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS 키 ARN"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: Production)"
  type        = string
}

variable "project_name" {
  description = "프로젝트 이름"
  type        = string
}
