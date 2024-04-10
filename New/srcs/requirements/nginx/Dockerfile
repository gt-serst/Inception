FROM debian:bullseye

RUN apt-get install \
	&& apt-get update \
	&& apt install -y vim \
	&& apt install -y nginx \
	&& mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" \
	&& chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf ./etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
