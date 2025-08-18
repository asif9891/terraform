resource "aws_s3_bucket" "example" {
  bucket = "ytfbucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}