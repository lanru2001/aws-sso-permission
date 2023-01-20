module "aws_sso_powerusers" {
    source  = "../.."
    version = "0.1.3"
    inline_create = "yes"


  name               = "sso_poweruser"
  description        = "Power user permission set"
  group_display_name = "Data Team AWS"
  session_duration   = "PT1H"

  account_ids = [
    "831611754233"
  ]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]

  inline_policy = data.aws_iam_policy_document.S3Access.json

  tags = {
    Team = "Engineering-Service"
  }
}

data "aws_iam_policy_document" "S3Access" {
  statement {
    sid = "1"

    actions = ["*"]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}
