resource "null_resource" "config_node_1" {
provisioner "file" {
        connection {
            host="${var.node-1-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }
        source     = "userdata/"
        destination = "/tmp/"
      }
provisioner "remote-exec" {
 connection {
            host="${var.node-1-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }

    inline = [
      "chmod +x /tmp/master_bootstrap.sh",
      "sudo /tmp/master_bootstrap.sh ",
    ]

  }
provisioner "file" {
        connection {
            host="${var.node-2-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }
        source     = "userdata/"
        destination = "/tmp/"
      }
provisioner "remote-exec" {
 connection {
            host="${var.node-2-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }

    inline = [
      "chmod +x /tmp/master_bootstrap.sh",
      "sudo /tmp/master_bootstrap.sh ",
    ]

  }
provisioner "file" {
        connection {
            host="${var.node-3-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }
        source     = "userdata/"
        destination = "/tmp/"
      }
provisioner "remote-exec" {
 connection {
            host="${var.node-3-public-ip}"
            user = "opc"
            private_key = "${file(var.ssh_private_key_path)}"
            }

    inline = [
      "chmod +x /tmp/master_bootstrap.sh",
      "sudo /tmp/master_bootstrap.sh ",
    ]

  }

}
