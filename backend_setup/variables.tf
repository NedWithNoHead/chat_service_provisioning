variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "lab11-bucket"
}

variable "dynamodb_name" {
  description = "DynamoDB table name"
  default     = "lab11-db"
  type        = string
}

data "aws_region" "aws_current_region" {}