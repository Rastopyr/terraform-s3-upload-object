# terraform-s3-upload-object

Terraform module for upload files to S3

## Motivation

Terraform resource for S3 object can only replace file if key is changes.
This module solve this with bash hack.

## Usage

```hcl

resource "aws_s3_bucket" "beanstalk_application_versions" {
  bucket = "beanstalk_application_versions"

  # ...other options
}

data "archive_file" "zip" {
  type        = "zip"

  source {
    content  = "hello world"
    filename = "Dockerrun.aws.json"
  }

  output_path = "${path.module}/zip.zip"
}

module "eb_upload_object" {
  source = "github.com/Rastopyr/terraform-s3-upload-object"

  access_key = "<aws_access_key_id>"
  secret_key = "<aws_secret_key_id>"
  region = "<aws_region>"

  file_path = "${path.module}/zip.zip"

  source_bucket = "${aws_s3_bucket.beanstalk_application_versions.name}"
  source_object = "${aws_s3_bucket_object.beanstalk_application_version.name}"
}

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
