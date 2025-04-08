
resource "aws_ecr_repository" "ecr_repository" {
  name = "headway"


  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# #To get repository name
# output "ecr_repository_name" {
#   description = "The name of the created Amazon ECR repository"
#   value       = aws_ecr_repository.ecr_repository.name

# }


# #To get DNS(URL) of my repository
# output "ecr_repository_url" {
#   description = "The URL of the Amazon ECR repository"
#   value       = aws_ecr_repository.ecr_repository.repository_url

# }

# resource "local_file" "ecr_url" {
#   filename = "ecr_url"
#   content = aws_ecr_repository.ecr_repository.repository_url
# }



