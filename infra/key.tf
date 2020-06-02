resource "aws_key_pair" "archerkeypair" {
  key_name   = "archerkeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

