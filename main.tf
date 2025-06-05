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

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  count = var.role_arn == null ? 0 : 1
  role       = var.role_arn
  policy_arn = aws_iam_policy.iam_policy.arn
}