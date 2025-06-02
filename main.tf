resource "aws_iam_policy" "iam_policy" {
  name        = var.name
  description = var.description

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.actions
        Resource = var.resources
      }
    ]
  })
}