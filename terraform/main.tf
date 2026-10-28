module "debian_image" {
  source       = "./modules/files/"
  node_name    = var.node_name
  content_type = "import"
  file_name    = "debian-13.qcow2"
  source_file  = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
}

module "database" {
  depends_on              = [module.debian_image]
  source                  = "./modules/database/"
  node_name               = var.node_name
  debian_image_id         = module.debian_image.id
  guest_username          = var.guest_username
  ssh_public_key_file     = var.ssh_public_key_file
  guest_ip                = "${var.guest_subnet}.${var.database_ip}"
  admin_password          = var.postgres_admin_password
  guest_network_interface = var.guest_network_interface
  guest_subnet_mask       = var.guest_subnet_mask
  guest_gateway           = "${var.guest_subnet}.${var.guest_gateway}"
  guest_dns_servers       = var.guest_dns_servers
}

module "kubernetes" {
  depends_on              = [module.debian_image]
  source                  = "./modules/kubernetes"
  node_name               = var.node_name
  debian_image_id         = module.debian_image.id
  guest_username          = var.guest_username
  ssh_public_key_file     = var.ssh_public_key_file
  kubernetes_version      = "v1.36"
  n_control_planes        = 1
  n_workers               = 2
  guest_network_interface = var.guest_network_interface
  guest_subnet            = var.guest_subnet
  start_ip                = var.kubernetes_start_ip
  guest_subnet_mask       = var.guest_subnet_mask
  guest_gateway           = "${var.guest_subnet}.${var.guest_gateway}"
  guest_dns_servers       = var.guest_dns_servers
}
