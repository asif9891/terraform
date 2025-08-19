resource "aws_s3_bucket" "testbucket" {
  bucket = "dev-test-my-app-table-d"
}

resource "aws_dynamodb_table" "my_app_table" {
  name = "dev-test-my-app-table-d"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "id"
    attribute {
        name = "id"
        type = "S"
    }
}