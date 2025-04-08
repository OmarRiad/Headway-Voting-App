resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.aws-eks-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch= "true"
  availability_zone = "ca-central-1a"

  tags = {
    Name = "public-ca-central-1a"
  }
}


resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.aws-eks-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch= "true"
  availability_zone = "ca-central-1b"

  tags = {
    Name = "public-ca-central-1b"
  }
}




