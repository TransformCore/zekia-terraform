data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ecs_task_execution_role" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${local.project}-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "assume_role" {
  name               = "${local.project}-assume-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "assume_role_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

resource "aws_iam_policy" "s3_policy" {
  name   = "${local.project}-s3-policy"
  policy = data.aws_iam_policy_document.s3.json
}

data "aws_iam_policy_document" "s3" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      data.aws_s3_bucket.state.arn
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${data.aws_s3_bucket.state.arn}/*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "iam:GetPolicy",
      "iam:GetPolicyVersion"
    ]
    resources = [
      "arn:aws:iam::*:policy/*"
    ]
  }
}

resource "aws_iam_user" "main" {
  name = "${local.project}-machine-user"
  path = "/system/"
}


data "aws_iam_policy_document" "athena" {
  statement {
    actions   = ["athena:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ce" {
  statement {
    actions   = ["ce:GetRightsizingRecommendation"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "glue" {
  statement {
    actions   = ["glue:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ssm" {
  statement {
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "kms" {
  statement {
    actions = [
      "kms:ListAliases",
      "kms:ListKeys",
      "kms:Decrypt"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:kms:${var.aws_region}:${data.aws_caller_identity.current.account_id}:key/*"
    ]
  }
}

resource "aws_iam_policy" "athena" {
  name   = "${local.project}-api-athena-policy"
  policy = data.aws_iam_policy_document.athena.json
}

resource "aws_iam_policy" "ce" {
  name   = "${local.project}-api-ce-policy"
  policy = data.aws_iam_policy_document.ce.json
}

resource "aws_iam_policy" "glue" {
  name   = "${local.project}-api-glue-policy"
  policy = data.aws_iam_policy_document.glue.json
}

resource "aws_iam_policy" "ssm" {
  name   = "${local.project}-api-ssm-policy"
  policy = data.aws_iam_policy_document.ssm.json
}

resource "aws_iam_policy" "kms" {
  name   = "${local.project}-api-kms-policy"
  policy = data.aws_iam_policy_document.kms.json
}

resource "aws_iam_role_policy_attachment" "athena" {
  policy_arn = aws_iam_policy.athena.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy_attachment" "ce" {
  policy_arn = aws_iam_policy.ce.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy_attachment" "glue" {
  policy_arn = aws_iam_policy.glue.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy_attachment" "ssm" {
  policy_arn = aws_iam_policy.ssm.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}

resource "aws_iam_role_policy_attachment" "kms" {
  policy_arn = aws_iam_policy.kms.arn
  role       = aws_iam_role.ecs_task_execution_role.name
}
