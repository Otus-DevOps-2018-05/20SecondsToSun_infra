terraform {
  backend "gcs" {
    bucket = "20secondstosun-backend"
    prefix = "prod"
  }
}
