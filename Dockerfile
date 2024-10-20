FROM python:3.8

WORKDIR /api

COPY . /api

RUN pip3 install -r /api/requirements.txt

CMD [ "bash", "/api/start-backend.sh"]
