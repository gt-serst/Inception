# FROM debian:buster

# RUN apt update
# RUN apt upgrade

# RUN apt install nginx -y
# RUN apt install openssl -y
# RUN apt install vim -y

# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=gt-serst.42.fr/UID=gt-serst"

# RUN rm /etc/nginx/nginx.conf
# COPY conf/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 443

#CMD [ "nginx"]

# FROM debian:buster

# RUN apt -y update && apt -y upgrade
# RUN apt install -y 	nginx \
# 			openssl \
# 			procps \
# 			vim

# RUN mkdir -p /etc/nginx/snippets/
# RUN mkdir -p /vat/run/nginx/
# RUN mkdir -p /var/www/html/wordpress

# RUN chmod 755 -R /var/www/html/
# RUN chown -R www-data:www-data /var/www/html/

# COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# COPY ./tools/nginx.sh /usr/local/bin/

# RUN chmod 777 -R /usr/local/bin/nginx.sh

#CMD ["/usr/local/bin/nginx.sh"]

FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
