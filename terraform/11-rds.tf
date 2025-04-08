# # Create RDS Instance
# resource "aws_db_instance" "rds_instance" {
#   # Configure RDS instance parameters
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "dbuser"
#   password             = "rdsinstacnce"
#   db_name              = "omar"
#   skip_final_snapshot  = true
#   storage_type        = "gp2"
#   publicly_accessible = true
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]

 

#   # Configure DB Subnet Group
#   db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
# }

# # Create Security Group for RDS Instance
# resource "aws_security_group" "rds_sg" {
#   name   = "rds-sg"
#   vpc_id = aws_vpc.aws-eks-vpc.id

#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Create DB Subnet Group for RDS Instance
# resource "aws_db_subnet_group" "rds_subnet_group" {
#   name       = "rds-subnet-group"
#   subnet_ids = [aws_subnet.public-1.id, aws_subnet.public-2.id]
# }

# resource "aws_secretsmanager_secret" "SM" {
#   name = "SM"
# }
# resource "aws_secretsmanager_secret_version" "SM_version"   {
#     secret_id = aws_secretsmanager_secret.SM.id
#     secret_string = jsonencode({
#         username = aws_db_instance.rds_instance.username,
#         password = aws_db_instance.rds_instance.password
#         })
# }