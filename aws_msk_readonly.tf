module "aws_sso_msk_readonly" {
    source  = "../.."
    version = "0.1.3"
    inline_create = "no"


  name               = "sso_msk_readonly"
  description        = "sso msk readonly"
  group_display_name = "Data Team AWS"
  session_duration   = "PT2H"

  account_ids = [
    "325685483689",
  ]
   
  inline_policy = "{}"

  managed_policy_arns = [
     "arn:aws:iam::aws:policy/AmazonMSKConnectReadOnlyAccess",
     "arn:aws:iam::aws:policy/AmazonMSKReadOnlyAccess"
  ]

}
