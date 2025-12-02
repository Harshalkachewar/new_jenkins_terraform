resource "null_resource" "create_dir_file" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = "192.168.1.190"
      user     = "root"
      password = "redhat"
    }

    inline = [
      "mkdir -p /tmp/mydir",
      "echo 'Hello from Terraform!' > /tmp/mydir/hello.txt"
    ]
  }
}
