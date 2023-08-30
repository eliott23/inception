FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install nginx -y

RUN apt-get install openssl -y

RUN openssl genpkey -algorithm RSA -out /etc/nginx/priv.key \
&& openssl req -new -batch -key /etc/nginx/priv.key -out /etc/nginx/server.csr \
&& openssl x509 -req -days 365 -in /etc/nginx/server.csr -signkey /etc/nginx/priv.key -out /etc/nginx/server.crt

COPY conf/nginx.conf /etc/nginx/conf.d/.

CMD ["nginx", "-g", "daemon off;"]