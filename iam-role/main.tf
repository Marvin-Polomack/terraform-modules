resource "aws_iam_openid_connect_provider" "github_oidc" {
  count            = var.create_oidc ? 1 : 0
  url              = "https://token.actions.githubusercontent.com"
  client_id_list   = ["sts.amazonaws.com"]
  thumbprint_list  = ["ffffffffffffffffffffffffffffffffffffffff"]
}

resource "aws_iam_role" "role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = var.oidc_provider_arn == "" ? aws_iam_openid_connect_provider.github_oidc[0].arn : var.oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = var.oidc_audience
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/${var.repository_name}:*"
          }
        }
      }
    ]
  })
  depends_on = [ aws_iam_openid_connect_provider.github_oidc ]
}