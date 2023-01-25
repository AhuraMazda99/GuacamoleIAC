terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}


provider "linode" {
  token = var.token
}
variable "token" {
  type = string
  description = "token"
  default = ""
}
variable "sshkey" {
  type = string
  description = "token"
  default = ""
}
resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu18.04"
        label = "Terraform-Web-Example"
        group = "Terraform"
        region = "us-east"
        type = "g6-standard-1"
        authorized_keys = var.sshkey
        root_pass = "test"
}