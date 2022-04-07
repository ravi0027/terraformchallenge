resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = var.bucket
  tags   = var.tags
}
resource "aws_s3_bucket_versioning" "aws_bucket_versioning" {
  bucket = aws_s3_bucket.aws_s3_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_acl" "aws_s3_bucket_acl" {
  bucket = aws_s3_bucket.aws_s3_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.aws_s3_bucket.bucket

  cors_rule {
    allowed_headers = var.allowed_headers
    allowed_methods = var.allowed_methods
    allowed_origins = var.allowed_origins
    expose_headers  = var.expose_headers
    max_age_seconds = var.max_age_seconds
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_s3_bucket_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.aws_s3_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "aws_s3_bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.aws_s3_bucket.id

  rule {
    id = var.lifecycle_rule_id

    filter {
      prefix = var.lifecycle_rule_prefix
    }

    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version
    }

    noncurrent_version_transition {
      noncurrent_days = var.noncurrent_version_transition_days
      storage_class   = var.noncurrent_version_transition_storage_class
    }
    status = var.noncurrent_status
  }
}