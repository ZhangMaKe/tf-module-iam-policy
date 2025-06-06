# AWS IAM Policy Terraform Module

This Terraform module creates an AWS IAM policy with customizable permissions and resources.

## Features

- Creates an IAM policy with specified actions and resources
- Configurable policy name and description
- Outputs the policy ARN for reference
- Attaches the policy to an IAM Role if an ID is provided


## Usage

```hcl
module "iam_policy" {
  source = "git::https://github.com/ZhangMaKe/tf-module-lambda-iam-policy.git?ref=v1.0.0"

  name        = "my-policy"
  description = "Custom IAM policy for specific resources"
  actions     = ["s3:GetObject", "s3:PutObject"]
  resources   = ["arn:aws:s3:::my-bucket/*"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the IAM policy | `string` | n/a | yes |
| description | The description of the IAM policy | `string` | `"Managed by Terraform"` | no |
| actions | List of IAM actions to allow | `list(string)` | n/a | yes |
| resources | List of resource ARNs the policy applies to | `list(string)` | `["*"]` | no |
| role_id | The name of the iam role to attach the policy to | `string` | null | no |


## Outputs

| Name | Description |
|------|-------------|
| policy_arn | The ARN of the created IAM policy |

## Example

Here's an example of creating an IAM policy for S3 bucket access:

```hcl
module "s3_access_policy" {
  source = "path/to/module"

  name        = "s3-access-policy"
  description = "Policy for S3 bucket access"
  actions     = [
    "s3:GetObject",
    "s3:PutObject",
    "s3:ListBucket"
  ]
  resources   = [
    "arn:aws:s3:::my-bucket",
    "arn:aws:s3:::my-bucket/*"
  ]
}
```

## Requirements

- AWS Provider

## License

This module is released under the MIT License.
