variable project {
  description = "Project ID"
}

variable user {
  description = "main user"
  default     = "appuser"
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

variable disk_image {
  description = "Disk image"
  default = "reddit-app"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "count" {
  default = "1"
}

variable "port" {
  default = "9292"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
