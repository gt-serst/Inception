FROM debian:buster

RUN apt-get update
RUN apt upgrade

RUN apt-get install nginx -y
RUN apt install openssl -y
RUN apt install vim -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=gt-serst.42.fr/UID=gt-serst"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx"]
