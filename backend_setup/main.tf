module "setup" {
  source        = "./modules/setup"
  bucket_name   = var.bucket_name
  dynamodb_name = var.dynamodb_name
}