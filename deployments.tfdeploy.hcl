identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

deployment "example" {
  variables = {
    aws_account_id      = "567875439609"
    region              = "us-east-1"
    stack_id            = "tfstack"
    role_arn            = "arn:aws:iam::567875439609:role/multi-product-demo-stack"
    identity_token_file = identity_token.aws.jwt_filename
  }
}
