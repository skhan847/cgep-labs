output "bucket_name" {
  value = aws_s3_bucket.primary.id
}

output "log_bucket_name" {
  value = aws_s3_bucket.log.id
}
