resource "aws_iam_instance_profile" "b2-group3" {
  name = "b2-group3-instance-profile"
  role = aws_iam_role.b2-group3.name
}

resource "aws_iam_role" "b2-group3" {
  name = "b2-group3-instance-profile"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


resource "aws_iam_role_policy" "b2-group3" {
  name = "b2-group3-policy"
  role = aws_iam_role.b2-group3.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:Get",
          "s3:Push",
        ]
        Resource = aws_s3_bucket.wp_deploy_bucket_b2group3.arn
      },
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter"
        ]
        Resource = [
          aws_ssm_parameter.db.arn,
          aws_ssm_parameter.user.arn,
          aws_ssm_parameter.password.arn,
          aws_ssm_parameter.entrypoint.arn,
          aws_ssm_parameter.auth_key.arn,
          aws_ssm_parameter.secure_auth_key.arn,
          aws_ssm_parameter.logged_in_key.arn,
          aws_ssm_parameter.nonce_key.arn,
          aws_ssm_parameter.auth_salt.arn,
          aws_ssm_parameter.secure_auth_salt.arn,
          aws_ssm_parameter.logged_in_salt.arn,
          aws_ssm_parameter.nonce_salt.arn
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt"
        ]
        Resource = aws_kms_key.params.arn
      }
    ]
  })
}

# create a service role for codedeploy
resource "aws_iam_role" "codedeploy_service" {
  name = "codedeploy-service-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "codedeploy.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# provide ec2 access to s3 bucket to download revision. This role is needed by the CodeDeploy agent on EC2 instances.
resource "aws_iam_role_policy_attachment" "instance_profile_codedeploy" {
  role       = aws_iam_role.b2-group3.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

# attach AWS managed policy called AWSCodeDeployRole
# required for deployments which are to an EC2 compute platform
resource "aws_iam_role_policy_attachment" "codedeploy_service" {
  role       = aws_iam_role.codedeploy_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}
