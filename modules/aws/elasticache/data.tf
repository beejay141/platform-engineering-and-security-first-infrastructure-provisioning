data "terraform_remote_state" "networking" {
  backend = "remote"
  config = {
    organization = "clipboard-staffing"
    workspaces = {
      name = "cbh-networking-${var.workspace}"
    }
  }
}
