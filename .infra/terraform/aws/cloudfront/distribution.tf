resource "aws_cloudfront_origin_access_identity" "oai" {
}

data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]
    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

resource "aws_cloudfront_distribution" "tf" {
  origin {
    origin_id = "${lower(var.product)}-${var.environment}"
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress = true
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = "${lower(var.product)}-${var.environment}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method = "sni-only"
  }

  tags = {
    Name = "${var.product} ${var.environment} distribution"
    Environment = var.environment
    Terraformed = true
  }
}
