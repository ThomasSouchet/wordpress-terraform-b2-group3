provider "aws" {
  region  = "eu-north-1"
  profile = "b2-group3"

  default_tags {
    tags = {
      Name    = "b2-group3"
      Project = "wp_blog_202108_03"
    }
  }
}
