output  jenkins_ec2_public_ip {value = aws_instance.jenkins_ec2.public_ip}
output  jenkins_ec2_public_dns { value = aws_instance.jenkins_ec2.public_dns}
output  jenkins_ec2_private_ip { value = aws_instance.jenkins_ec2.private_ip}
output  jenkins_ec2_private_dns {value = aws_instance.jenkins_ec2.private_dns}
output  nexus_ec2_public_ip {value = aws_instance.nexus_ec2.public_ip}
output  nexus_ec2_public_dns { value = aws_instance.nexus_ec2.public_dns}
output  nexus_ec2_private_ip { value = aws_instance.nexus_ec2.private_ip}
output  nexus_ec2_private_dns {value = aws_instance.nexus_ec2.private_dns}
output  sonerqube_ec2_public_ip {value = aws_instance.sonerqube_ec2.public_ip}
output  sonerqube_ec2_public_dns { value = aws_instance.sonerqube_ec2.public_dns}
output  sonerqube_ec2_private_ip { value = aws_instance.sonerqube_ec2.private_ip}
output  sonerqube_ec2_private_dns {value = aws_instance.sonerqube_ec2.private_dns}