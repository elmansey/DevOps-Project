terraform {
  backend "s3" {
    bucket = "remote-backendstate"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    dynamodb_table = "locking_state"
  }
}
