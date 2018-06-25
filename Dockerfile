FROM python:3.6.5

COPY ./.env /jobsdone/.env
COPY ./src /jobsdone/src
COPY ./requirements.txt /jobsdone/requirements.txt
COPY ./setup.py /jobsdone/setup.py

WORKDIR /jobsdone

RUN pip install pip==10.0.1
RUN pip install . -r requirements.txt

ENV JOBSDONE_DOTENV /jobsdone/.env

EXPOSE 5000

CMD ["gunicorn", "jobs_done10.server:app", "-b", "0.0.0.0:5000", "--workers", "4", "--timeout", "300", "--log-level=debug"]