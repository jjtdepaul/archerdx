data "template_file" "init-script" {
  template = file("scripts/init.cfg")
  vars = {
    REGION = var.AWS_REGION
  }
}

data "template_file" "shell-script-docker" {
  template = file("scripts/docker-config.sh")
  vars = {
    USER = "ubuntu"
  }
}


data "template_file" "shell-script-jenkins" {
  template = file("scripts/run-jenkins.sh")
  vars = {
    USER = "ubuntu"
  }
}


data "template_cloudinit_config" "cloudinit-docker" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.init-script.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-docker.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-jenkins.rendered
  }
}

