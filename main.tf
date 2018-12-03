
locals {
  command = "bash ${path.module}/bin/build.sh ${var.region} ${var.access_key} ${var.secret_key} ${var.source_bucket} ${var.source_key} ${var.file_path}"
}

resource "null_resource" "deploy_version" {
  triggers {
    build_folder_content_md5 = "${md5(local.command)}"
  }

  provisioner "local-exec" {
    command = "${local.command}"
  }
}
