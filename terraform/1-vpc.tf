resource "aws_vpc" "aws-eks-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true #instance use route53 as DNS
  enable_dns_hostnames = true #give ec2 DNS

  tags = {
    Name = "aws-eks-vpc"
  }
}