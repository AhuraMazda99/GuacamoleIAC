terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = data.linode_account.Current.token
}
data "linode_account" "Current" {
}

resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu18.04"
        label = "Terraform-Web-Example"
        group = "Terraform"
        region = "us-east"
        type = "g6-standard-1"
        authorized_keys = [ "YOUR_PUBLIC_SSH_KEY" ]
        root_pass = "test"
}