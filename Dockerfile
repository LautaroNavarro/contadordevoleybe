FROM python:3.7

WORKDIR /app

COPY requirements.txt ./

RUN python3 -m pip install --upgrade pip

RUN pip3 install -r requirements.txt

COPY . .

ENV DEBUG=False

CMD ["python", "manage.py", "migrate", "&&", "python",  "manage.py", "runserver", "0.0.0.0:$PORT"]
