resource "aws_db_subnet_group" "b2group3" {
  name       = "b2group3"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

resource "aws_db_instance" "rds" {
  identifier             = "b2group3db"
  name                   = "b2group3db"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "5.7"
  username               = "b2group3user"
  password               = random_password.password.result
  port                   = "3306"
  availability_zone      = "eu-north-1a"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.b2group3.name
  vpc_security_group_ids = [aws_security_group.db.id]
}