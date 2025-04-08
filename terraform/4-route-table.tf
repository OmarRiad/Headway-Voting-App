resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.aws-eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public"
  }
}


resource "aws_route_table_association" "rt-ass-public-1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "rt-ass-public-2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.rt-public.id
}









