terraform {
  required_providers {
    linux = {
      source  = "mavidser/linux"
      version = "1.0.2"
    }
  }
}

provider "linux" {
  host     = "192.168.1.190"
  port     = 22
  user     = "root"
  password = "redhat"
}

# Create a file on the remote Linux server
resource "linux_file" "myfile" {
  path    = "/mnt/myfile.txt"
  content = "Hello from Terraform via Jenkins!"
}

# Example: Create a directory
resource "linux_directory" "mydir" {
  path = "/mnt/mydir"
}
