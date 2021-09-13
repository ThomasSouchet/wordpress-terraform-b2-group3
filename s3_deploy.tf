resource "aws_s3_bucket" "wp_deploy_bucket_b2group3" {
  bucket        = "wp-b2group3"
  force_destroy = true
}

resource "aws_codedeploy_app" "b2-group3" {
  name = "b2-group3"
}

resource "aws_codedeploy_deployment_group" "b2-group3" {
  app_name              = aws_codedeploy_app.b2-group3.name
  deployment_group_name = "b2-g3-group"
  service_role_arn      = aws_iam_role.codedeploy_service.arn
  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "ec2_b2-group3"
    }
  }
}

