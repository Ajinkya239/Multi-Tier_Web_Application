resource "aws_key_pair" "ssh_key" {
  key_name   = "secure-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAG7+UDshWZ+GgCtVoBTGt9dP2mg5EPMKPRQ+1yuiBdY ajinkyapatil@AJ-Macbook.local"
}
