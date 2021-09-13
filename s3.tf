terraform {
  backend "s3" {
    bucket         = "simplon-devops-b2-tf-backend-groupe3"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    profile        = "b2-group3"
    kms_key_id     = "alias/simplon-devops-b2-tf-backend-groupe3"
    dynamodb_table = "simplon-devops-b2-tf-backend-groupe3"
    role_arn       = "arn:aws:iam::085586464868:role/simplon-devops-b2-tf-backend-groupe3_access"
  }
}
