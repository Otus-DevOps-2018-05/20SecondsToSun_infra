resource "google_compute_global_forwarding_rule" "app" {
  name       = "reddit-app-forwarding-rule"
  target     = "${google_compute_target_http_proxy.app.self_link}"
  port_range = "80"
}

resource "google_compute_target_http_proxy" "app" {
  name    = "reddit-app-http-proxy"
  url_map = "${google_compute_url_map.app.self_link}"
}

resource "google_compute_url_map" "app" {
  name            = "reddit-app-url-map"
  default_service = "${google_compute_backend_service.app.self_link}"
}

resource "google_compute_instance_group" "appservers" {
  name      = "reddit-app-instance-group"
  instances = ["${google_compute_instance.app.*.self_link}"]

  named_port {
    name = "reddit-app-port"
    port = "${var.port}"
  }

  zone = "${var.zone}"
}

resource "google_compute_backend_service" "app" {
  name        = "reddit-app-backend-service"
  port_name   = "reddit-app-port"
  protocol    = "HTTP"
  timeout_sec = 5

  backend {
    group = "${google_compute_instance_group.appservers.self_link}"
  }

  health_checks = ["${google_compute_health_check.app.self_link}"]
}

resource "google_compute_health_check" "app" {
  name               = "reddit-app-health-check"
  check_interval_sec = 5
  timeout_sec        = 1

  http_health_check {
    port         = "${var.port}"
  }
}

resource "google_compute_firewall" "firewall_lb" {
  name    = "allow-lb-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
