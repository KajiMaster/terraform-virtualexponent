resource "aws_s3_bucket" "important_bucket" {
  bucket = "important-bucket-${var.env}"

  tags = merge(
    local.default_tags,
    {
      Name        = "important-bucket-${var.env}"
      Environment = var.env
    }
  )
}