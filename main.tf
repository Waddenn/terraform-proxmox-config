terraform {
  required_version = ">= 1.5.0"
}

module "lxc_containers" {
  source = "./modules/lxc"

  containers = merge(
    local.infrastructure_containers,
    local.application_containers,
    local.media_containers,
    local.development_containers
  )
}
