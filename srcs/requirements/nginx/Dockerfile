FROM debian:bullseye

RUN apt-get update\
	&& apt-get upgrade \
	&& apt-get install -y nginx \
	&& mkdir -p /etc/nginx/ssl \
	&& apt-get install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=BE/ST=BC/L=Bruxelles/O=19/OU=19/CN=gt-serst.42.fr/UID=gt-serst" \
	&& mkdir -p /var/run/nginx \
	&& chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

COPY /conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
