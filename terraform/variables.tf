variable "host" {
  description = "Host for proxmox endpoint"
  type        = string
  nullable    = false
}

variable "port" {
  description = "Port for proxmox endpoint"
  type        = number
  nullable    = false
  default     = 8006
}

variable "insecure" {
  description = "Whether to skip TLS verification"
  type        = bool
  nullable    = false
  default     = true
}

variable "token_username" {
  description = "Username for proxmox API token"
  type        = string
  nullable    = false
}

variable "token_name" {
  description = "Name of the proxmox API token"
  type        = string
  nullable    = false
}

variable "token_key" {
  description = "Secret key for the proxmox API token"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "ssh_username" {
  description = "Username for ssh-agent"
  type        = string
  nullable    = false
}

variable "ssh_public_key_file" {
  description = "Path to the public SSH key to install on VMs for access"
  type        = string
  nullable    = false
  default     = "~/.ssh/id_ed25519.pub"
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
  nullable    = false
  default     = "proxmox"
}

variable "postgres_admin_password" {
  description = "Password to set for postgres database"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "guest_username" {
  description = "User to create on guests"
  type        = string
  nullable    = false
}

variable "guest_network_interface" {
  description = "Network interface name inside the guest"
  type        = string
  nullable    = false
  default     = "ens18"
}

variable "guest_subnet" {
  description = "Subnet for VM IP's"
  type        = string
  nullable    = false
  default     = "192.168.0"
}

variable "guest_subnet_mask" {
  description = "Subnet mask for guest"
  type        = number
  nullable    = false
  default     = 24
}

variable "guest_gateway" {
  description = "Last octet of guest gateway"
  type        = number
  nullable    = false
}

variable "guest_dns_servers" {
  description = "DNS servers for the guest"
  type        = list(string)
  nullable    = false
}

variable "database_ip" {
  description = "Last octet for database VM's IP"
  type        = string
  nullable    = false
}

variable "kubernetes_start_ip" {
  description = "Number to start last octet in kubernetes ip's from"
  type        = number
  nullable    = false
}
