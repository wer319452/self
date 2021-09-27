FROM python:3.9.0

WORKDIR /home/

RUN echo 'aasdfswwewf'

RUN git clone https://github.com/wer319452/self.git

WORKDIR /home/self/

RUN echo 'SECRET_KEY=django-insecure-vqa!k8!ya&m=3+8gro#982f=ptp4jvjsv@%r8fgob_109k=5sr' > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=djangoProject11.settings.deploy && python manage.py migrate --settings=djangoProject11.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=djangoProject11.settings.deploy djangoProject11.wsgi --bind 0.0.0.0:8000"]
