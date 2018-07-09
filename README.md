# 20SecondsToSun_infra
20SecondsToSun Infra repository

# Homework 04

### IP Addresses

testapp_IP = 35.195.231.194

testapp_port = 9292

### Startup script from file
```bash
gcloud compute instances create reddit-app1 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=c:\_projects\OTUS-learn\20SecondsToSun_infra\startup_script.sh
```
# Homework 03

### Connect with one command

```bash
ssh -i ~/.ssh/20secondstosun -A 20secondstosun@35.205.214.162 ssh 10.132.0.3
```

### IP Addresses

bastion_IP = 35.205.214.162

someinternalhost_IP = 10.132.0.3
