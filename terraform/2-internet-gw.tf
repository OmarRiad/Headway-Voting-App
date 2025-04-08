resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.aws-eks-vpc.id

  tags = {
    Name = "igw"
  }
}