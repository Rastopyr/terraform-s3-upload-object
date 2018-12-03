
variable "access_key" {
  type = "string"
  description = "AWS access key"
}

variable "secret_key" {
  type = "string"
  description = "AWS secret access key"
}

variable "region" {
  type = "string"
  description = "AWS region"
}

variable "file_path" {
  type = "string"
  description = "Path to uploaded file"
}

variable "source_bucket" {
  type = "string"
  description = "Bucket for upload object"
}

variable "source_key" {
  type = "string"
  description = "Path to uploaded object"
}
