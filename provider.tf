
provider "aws" {

  region = var.aws_region
  # profile = "default"

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
      Team        = "levva"
    }
  }
}
