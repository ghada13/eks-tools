terraform {
  # Terraform configuration for Azure backend.
  backend "s3" {
    bucket = "eks-bucket-ghada"
    key    = "eks-tools/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
