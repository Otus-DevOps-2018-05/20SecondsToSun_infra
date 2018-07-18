variable public_key_path {
  description = "public SSH key path"
}

variable "zone" {
  default = "europe-west1-b"
}

variable db_disk_image {
  description = "Disk image for reddit db"
}
