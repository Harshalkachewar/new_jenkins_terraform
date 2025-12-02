terraform {
  required_version = ">= 1.0"
}

resource "null_resource" "create_file" {
  provisioner "remote-exec" {
    inline = [
      "echo 'File created by Terraform via Jenkins Pipeline' > /root/jenkins_terraform.txt",
      "echo 'Created at: $(date)' >> /root/jenkins_terraform.txt"
    ]

    connection {
      type              = "ssh"
      host              = var.server_ip
      user              = var.server_user
      password          = var.server_password
      host_key_checking = false
    }
  }
}
