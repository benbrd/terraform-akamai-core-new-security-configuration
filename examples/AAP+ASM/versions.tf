terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = ">= 3.2.0"
    }
  }
  # Constraint to specify which versions of Terraform can be used with this configuration.
  required_version = ">= 1.0.0"
}