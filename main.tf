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
  for_each = toset(var.role_id != "" ? ["enabled"] : []) 
  role       = var.role_id
  policy_arn = aws_iam_policy.iam_policy.arn
}