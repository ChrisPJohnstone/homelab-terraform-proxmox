locals {
  first_node_ip      = "${var.guest_subnet}.${var.start_ip}"
  first_node_ssh_cmd = "${var.ssh_cmd} ${var.guest_username}@${local.first_node_ip}"

}
