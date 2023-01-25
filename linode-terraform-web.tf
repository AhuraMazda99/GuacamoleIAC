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
        root_pass = var.root_pass
}

provider "linode" {
  token = var.token
}
variable "token" {
  type = string
  description = "token"
  default = "2222881c62cbda6a15257d7c1df8142f7f0f9aa0689bf8c25df3a0f56278a782"
}
variable "root_pass" {
  type = string
  description = "root password"
  default = ""
}