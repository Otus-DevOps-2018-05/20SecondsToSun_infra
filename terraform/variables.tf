variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "public SSH key path"
}

variable private_key_path {
  description = "private SSH key path"
}

variable "zone" {
  default = "europe-west1-b"
}

variable disk_image {
  description = "Disk image"
}
