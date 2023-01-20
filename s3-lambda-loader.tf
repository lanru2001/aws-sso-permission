module "aws_sso_s3_bi_lambda_loader" {
    source  = "../.."
    version = "0.1.3"
    inline_create = "yes"


  name               = "sso_s3_bi_lambda_loader"
  description        = "S3 customer files  full access"
  group_display_name = "AWS S3_biz_Lambda-Loader"
  session_duration   = "PT1H"

  account_ids = [
    "374770275786"
  ]

  managed_policy_arns = []

  inline_policy = data.aws_iam_policy_document.sso_s3_bi_lambda_loader.json

  tags = {
    managed_by = "Terraform"
  }
}

data "aws_iam_policy_document" "sso_s3_bi_lambda_loader" {
    statement {
       sid = "Stmt1430942563000"
       effect = "Allow"
       actions = [
                "s3:GetBucketLocation",
                "s3:GetAccountPublicAccessBlock",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketPolicyStatus",
                "s3:GetBucketAcl",
                "s3:ListAccessPoints",
                "s3:ListAllMyBuckets"
            ]
       resources=  [ "arn:aws:s3:::*" ]
        }
    statement {
       effect =  "Allow"
       actions = [ "s3:ListBucket" ]
       resources = [ "arn:aws:s3:::biz-lambda-loader"]
        }
    statement {
        effect = "Allow"
        actions = [ "s3:*" ]
        resources = [
                "arn:aws:s3:::biz-lambda-loader",
                "arn:aws:s3:::biz-lambda-loader/*"
            ]
        }
    
}
