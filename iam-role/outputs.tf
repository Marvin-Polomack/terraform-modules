output "role_arn" {
  value = aws_iam_role.role.arn
}

output "oidc_provider_arn" {
  value = var.oidc_provider_arn == "" ? aws_iam_openid_connect_provider.github_oidc[0].arn : var.oidc_provider_arn
}