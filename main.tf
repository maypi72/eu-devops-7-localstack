#################################
# S3 buckets
#################################
resource "aws_s3_bucket" "La_huella_sentiment_reports" {
  bucket = "la-huella-sentiment-reports"
}

resource "aws_s3_bucket" "la_huella_uploads" {
  bucket = "la-huella-uploads"
}

#################################
# DynamoDB tables
#################################
resource "aws_dynamodb_table" "la_huella_comments" {
  name         = "la-huella-comments"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "commentId"

  attribute {
    name = "commentId"
    type = "S"
  }
}

resource "aws_dynamodb_table" "la_huella_products" {
  name         = "la-huella-products"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "productId"

  attribute {
    name = "productId"
    type = "S"
  }
}

resource "aws_dynamodb_table" "la_huella_analytics" {
  name         = "la-huella-analytics"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "metricId"

  attribute {
    name = "metricId"
    type = "S"
  }
}

#################################
# SQS queues
#################################
resource "aws_sqs_queue" "la_huella_processing" {
  name                      = "la-huella-processing-queue"
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue" "la_huella_notifications" {
  name                      = "la-huella-notifications-queue"
  visibility_timeout_seconds = 30
}

#################################
# CloudWatch Logs
#################################
resource "aws_cloudwatch_log_group" "application" {
  # Usa el nombre que prefieras exactamente:
  name              = "/aws/la-huella/la-huella-aplication"
  retention_in_days = 7
}