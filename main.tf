terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

provider "null" {}

resource "null_resource" "create_dir_file" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = "192.168.1.190"
      user     = "root"
      password = "redhat"
    }

    inline = [
      "mkdir -p /mnt/mydir",
      "echo 'Hello from Terraform!' > /mnt/mydir/hello.txt"
    ]
  }
}
