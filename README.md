[![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/20SecondsToSun_infra.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2018-05/20SecondsToSun_infra)
# 20SecondsToSun_infra

20SecondsToSun Infra repository

# Homework 08
### Основная часть
- Установлен ansible
- Протестированы различные способы подключения и команды
- Создан playbook для скачивания reddit app из репозитория
- Скрипт удаляет локальный репозиторий

```bash
ansible app -m command -a 'rm -rf ~/reddit'
```
- ansible-playbook clone.yml склонирует репозиторий, так как он был удален

# Homework 07
### Основная часть
- Конфигурация разбита по файлам
- Созданы модули *app, db, vpc*
- Добавлена параметризация
- Проверена работа параметризованного модуля vpc с разными IP
- Созданы *stage/prod*
- Проверена работа реестра модулей
### Дополнительная часть
- Настроено хранение стейт файла в удаленном бекенде
- Проверена работа блокировок

# Homework 06
### Создано terraform окружение
- Параметризован *main.tf*
- Параметры заданы в *terraform.tfvars.example*
- Формат файлов через **terraform fmt**

### Ключи для пользователей
- Добавлено несколько новых пользователей в *main.tf*
- Добавлен ключ пользователя через web консоль, после применения комманды **terraform apply** - ключ удалился

### Балансировщик
- Создан HTTP балансировщик, направляющий трафик на наше развернутое приложение на инстансе *reddit-app*
- Добавлена переменная *count*, управляющая количеством создаваемых инстансов

# Homework 05
### Создан и параметризован шаблон packer
- project_id
- source_image_family
- machine_type
- disk_size
- disk_type
- tags
- network
- image_description

Команда создания образа
```bash
packer validate -var-file=variables.json ubuntu16.json
packer build -var-file=variables.json ubuntu16.json
```
### Immutable infrastructure
Создан шаблон *immutable.json*<br/>
Добавлен скирпт деплоя приложения<br/>
Добавлен *reddit-app.service* в *systemd* образа VM

### Gcloud script
```bash
gcloud compute instances create reddit-app-packer
--image-family=reddit-full 
--boot-disk-size=10GB 
--machine-type=g1-small 
--tags puma-server 
--zone europe-west1-d 
--restart-on-failure
```

# Homework 04

### IP Addresses

testapp_IP = 35.195.231.194<br/>
testapp_port = 9292

### Startup script from file
```bash
gcloud compute instances create reddit-app10 
--boot-disk-size=10GB 
--image-family ubuntu-1604-lts 
--image-project=ubuntu-os-cloud 
--machine-type=g1-small 
--tags puma-server 
--restart-on-failure 
--metadata-from-file startup-script=c:\_projects\OTUS-learn\20SecondsToSun_infra\startup_script.sh
```

### Gcloud firewall-rules
```bash
gcloud compute --project=infra-209621 firewall-rules create default-puma-server-1
--target-tags=puma-server 
--source-ranges=0.0.0.0/0
--rules=tcp:9292
--action=ALLOW
--priority=1000
--network=default
```

# Homework 03

### Connect with one command

```bash
ssh -i ~/.ssh/20secondstosun -A 20secondstosun@35.205.214.162 ssh 10.132.0.3
```

### IP Addresses

bastion_IP = 35.205.214.162<br/>
someinternalhost_IP = 10.132.0.3
