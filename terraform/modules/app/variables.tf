variable public_key_path {
  description = "public SSH key path"
}

variable "zone" {
  default = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
