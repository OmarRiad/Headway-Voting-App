
resource "aws_subnet" "jenkins-subnet" {
  vpc_id     = aws_vpc.aws-eks-vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch= "true"
  availability_zone = "ca-central-1b"
  

  tags = {
    Name = "jenkins-subnet"
  }
}


resource "aws_route_table_association" "jenkins-subnet" {
  subnet_id      = aws_subnet.jenkins-subnet.id
  route_table_id = aws_route_table.rt-public.id
}



resource "aws_instance" "jenkins-instance" {
  ami           = "ami-055943271915205db"
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.jenkins-subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.sg.id]
  availability_zone = "ca-central-1b"
  key_name = aws_key_pair.my-key.key_name 
  # iam_instance_profile = aws_iam_instance_profile.jenkins_ecr_profile.name
  tags = {
    Name = "jenkins-instance"
  }
}




