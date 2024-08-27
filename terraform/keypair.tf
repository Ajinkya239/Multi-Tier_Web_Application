resource "aws_key_pair" "ssh_key" {
  key_name   = "secure-key"
  public_key = "<add your public key here>"
