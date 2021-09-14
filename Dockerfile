FROM python:3.9.0

WORKDIR /home/

RUN echo 'fsdafsdfasdf'

RUN git clone https://github.com/wer319452/self.git

WORKDIR /home/self/

RUN echo 'SECRET_KEY=django-insecure-vqa!k8!ya&m=3+8gro#982f=ptp4jvjsv@%r8fgob_109k=5sr' > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "djangoProject11.wsgi", "--bind", "0.0.0.0:8000"]
