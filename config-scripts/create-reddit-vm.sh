#!/bin/bash
gcloud compute instances create reddit-app-packer --image-family=reddit-full --boot-disk-size=10GB --machine-type=g1-small --tags puma-server --zone europe-west1-d --restart-on-failure
