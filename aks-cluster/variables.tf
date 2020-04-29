variable client_id {}
variable client_secret {}
variable ssh_public_key {}

variable environment {
  default = "dev"
}

variable location {
  default = "eastus"
}

variable node_count {
  default = 2
}



variable dns_prefix {
  default = "dellemcaks"
}

variable cluster_name {
  default = "dellemcaks"
}

variable resource_group {
  default = "dellemcaks_rg"
}
