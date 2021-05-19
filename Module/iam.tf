# ELASTIC EC2 INSTANCE PROFILE 

resource "aws_iam_instance_profile" "elastic_instance_profile" {
  name = "${var.application_name}-${var.environment}-ELASTIC-EC2-ROLE"
  role = aws_iam_role.elastic-role.name
}

# ELASTIC EC2 IAM ROLE

resource "aws_iam_role" "elastic-role" {
  name                 = "${var.application_name}-${var.environment}-ELASTIC-EC2-ROLE"
  path                 = "/"
  assume_role_policy   = data.aws_iam_policy_document.ec2_assumerole_policy.json
}

# EC2 ASSUME ROLE POLICY 

data "aws_iam_policy_document" "ec2_assumerole_policy" {
    statement {
    sid    = "ec2assumerole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
     principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

# IAM POLICIES 


# S3 POLICY

# S3 Read-Write Access policy

data "aws_iam_policy_document" "s3_rw_access" {
 statement {
    actions   = ["s3:GetObject", "s3:DeleteObject", "s3:PutObject"]
    resources = [ 
          "arn:aws:s3:::${local.s3_bucket}/*"
        ]
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = [ 
          "arn:aws:s3:::${local.s3_bucket}"
        ]
  }
 }

resource "aws_iam_policy" "s3_rw_access_policy" {
  name        = "${var.application_name}-${var.environment}-S3-POLICY"
  path        = "/"
  description = "Policy for S3 RW Access"
  policy      = data.aws_iam_policy_document.s3_rw_access.json
}



#attach S3 policy 
resource "aws_iam_role_policy_attachment" "attach-elastic-s3-policy" {
  role       = aws_iam_role.elastic-role.name
  policy_arn = aws_iam_policy.s3_rw_access_policy.arn
}


#attach SSM policy 
resource "aws_iam_role_policy_attachment" "attach-ssm-policy" {
  role       = aws_iam_role.elastic-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
