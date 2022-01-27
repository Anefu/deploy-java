terraform {
  cloud {
    organization = "ATech"

    workspaces {
      name = "infrastructure"
    }
  }
}