
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




/*

resource "aws_ebs_volume" "jenkins_volume" {
  availability_zone = "eu-west-1c"
  size              = 10
  type              = "gp2"

  tags = {
    Name = "jenkins-volume"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdf"
  instance_id = aws_instance.jenkins-instance.id
  volume_id   = aws_ebs_volume.jenkins_volume.id
}

resource "aws_iam_role" "backup_role" {
  name = "aws_backup_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "backup.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "backup_role_policy" {
  role       = aws_iam_role.backup_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

# AWS Backup Vault
resource "aws_backup_vault" "backup_vault" {
  name        = "example-backup-vault"
  force_destroy = true
  tags = {
    Name = "example-backup-vault"
  }
}

# AWS Backup Plan
resource "aws_backup_plan" "backup_plan" {
  name = "example-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = "cron(0 12 * * ? *)"  # Daily at 12:00 UTC
    lifecycle {
      delete_after = 30  # Retain backups for 30 days
    }
  }
}

# AWS Backup Selection
resource "aws_backup_selection" "backup_selection" {
  name          = "example-backup-selection"
  plan_id       = aws_backup_plan.backup_plan.id
  iam_role_arn  = aws_iam_role.backup_role.arn

  resources = [
    aws_instance.jenkins-instance.arn,
    aws_ebs_volume.jenkins_volume.arn
  ]
}



resource "local_file" "inventory" {
  filename = "../ansible/inventory"
  content  = aws_instance.jenkins-instance.public_ip
}


*/