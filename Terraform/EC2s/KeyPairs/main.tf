# generate public and private key pair 
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


# store private key pair into my machine to use it with ssh connect 
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "/home/elmansey/.ssh/private_key.pem"
}

# create aws key pair by public key
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}