resource "aws_eip" "eip" {
  instance = aws_instance.main.id
  vpc      = true
}