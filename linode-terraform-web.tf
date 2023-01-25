terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}



resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu18.04"
        label = "Terraform-Web-Example"
        group = "Terraform"
        region = "us-east"
        type = "g6-nanode-1"
        authorized_keys = var.sshkey
        root_pass = [var.root_pass]
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
  description = "sshkey"
  default = [""]
}
variable "root_pass" {
  type = string
  description = "root password"
  default = ""
}