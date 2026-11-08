data "terraform_remote_state" "networking" {
  backend = "remote"
  config = {
    organization = "<your-tfc-org>"
    workspaces = {
      name = "cbh-networking-${var.networking_environment}"
    }
  }
}
