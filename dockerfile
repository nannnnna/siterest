# Используйте официальный образ Python 3.9
FROM python:3.9

# Установите переменную окружения для запуска Django в режиме "production"
ENV DJANGO_SETTINGS_MODULE=siterest.settings

# Создайте и перейдите в рабочую директорию /app
WORKDIR /app

# Скопируйте файлы requirements.txt в контейнер и установите зависимости
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Установите Gunicorn
RUN pip install gunicorn

# Скопируйте содержимое вашего проекта в контейнер
COPY . /app/

# Запустите команду collectstatic для сбора статических файлов (если применимо)
RUN python manage.py collectstatic --noinput

# Запустите ваше Django приложение
CMD ["gunicorn", "siterest.wsgi:application", "--bind", "0.0.0.0:8000"]
