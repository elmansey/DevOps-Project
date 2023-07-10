# jenkins port 8080
# nexus port 8081 and 5000 to docker 
# sonerqube port 9000

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  # inbound
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# for jenkins 
resource "aws_security_group" "jenkins_sg" {
  name        = "allow_port_8080"
  description = "Allow port 8080 inbound traffic"
  vpc_id      = var.vpc_id

  # inbound
  ingress {
    description      = "ssh from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}

# for nexus 
resource "aws_security_group" "nexus_sg" {
  name        = "nexus_sg"
  description = "allow port 8081 and 5000 traffic"
  vpc_id      = var.vpc_id

  # inbound
  ingress {
    description      = "ssh from VPC"
    from_port        = 8081
    to_port          = 8081
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # for docker registery 
  ingress {
    description      = "ssh from VPC"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "nexus_sg"
  }
}

resource "aws_security_group" "sonerqube_sg" {
  name        = "sonerqube_sg"
  description = "Allow 9000 port inbound traffic"
  vpc_id      = var.vpc_id

  # inbound
  ingress {
    description      = "ssh from VPC"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  # outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sonerqube_sg"
  }
}


resource "aws_security_group" "Eks_cluster_sg" {
  name_prefix = "Eks_cluster_sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    # security_groups = [aws_security_group.BastionHost_sg.id]
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Eks_cluster_sg"
  }
}