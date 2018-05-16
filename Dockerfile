FROM debian:9

RUN apt-get update && \
	apt-get install -y python3 virtualenv git curl wget python3-pip

RUN mkdir /webapps

WORKDIR /webapps

RUN git clone https://github.com/healthchecks/healthchecks.git

RUN pip3 install -r healthchecks/requirements.txt

EXPOSE 8080

ADD docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

