FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install mariadb-server -y

COPY conf/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]