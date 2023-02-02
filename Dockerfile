FROM python:3
COPY .  /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
# CMD sh -c "python3 manage.py collectstatic --noinput && python3 manage.py migrate && gunicorn capstone.wsgi"
CMD sh -c "python3 manage.py migrate && python3 manage.py runserver"