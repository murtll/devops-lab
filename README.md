### Проект
REST API для сервиса YaMDb — базы отзывов о фильмах, книгах и музыке. Написан на Django Rest Framework.

### Деплой через Github Actions

Необходимые секреты:

Environment: `master`
* ACME_EMAIL - почта для аккаунта Let's Encrypt (автополучение сертификатов)
* DB_HOST
* DB_NAME
* DB_PASSWORD
* DB_PORT
* DB_USER
* DEPLOY_HOST - хост, на котором будет доступен сервис
* DEPLOY_KEY - приватный SSH-ключ для доступа на сервер
* SERVER - IP сервера на котором будет развертываться сервис
* SSH_USER - пользователь который будет использоваться на сервере

Repository-level:
* DOCKERHUB_PASSWORD
* DOCKERHUB_USERNAME
* TELEGRAM_TO - id чата в Telegram, куда будут отправляться уведомления о статусе пайплайна
* TELEGRAM_TOKEN - токен бота, который будет отправлять уведомления

После первого (чистового) деплоя потребуется подключиться на сервер, зайти в папку с проектом и выполнить команды
1. Создайте суперпользователя командой ```docker compose exec web python manage.py createsuperuser``` 
2. Заполните базу тестовыми данными, выполнив команду ```docker compose exec web python manage.py loaddata fixtures.json``` 


## Использованные технологии

* [Django REST Framework](https://www.django-rest-framework.org/) - Веб-фреймворк
* [Docker & Docker Compose](https://www.docker.com/) - Управление сборкой и запуском приложения
* [Ansible](https://www.ansible.com/) - Система управления конфигурациями серверов
* [Traefik](https://www.traefik.io/) - Веб-сервер
* [PostgreSQL](https://www.postgresql.org/) - СУБД