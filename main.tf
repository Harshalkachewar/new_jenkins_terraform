provider "null" {}

resource "null_resource" "create_dir_file" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = "your_server_ip"
      user        = "your_ssh_user"
      private_key = file("~/.ssh/id_rsa")
    }

    inline = [
      "mkdir -p /tmp/mydir",
      "echo 'Hello from Terraform!' > /tmp/mydir/hello.txt"
    ]
  }
}
