FROM alpine

#apk install
RUN		set -eux;\
		apk update;\
		apk add \
		wget \
		nginx \
		openssl \
		openssh \
		openrc \
		php-fpm \
		php-mbstring

#copy files
RUN		rm -f /var/lib/nginx/html/index.html
COPY	./srcs/ft_nginx.conf /etc/nginx/http.d/ft_nginx.conf
COPY	./srcs/index.html /var/lib/nginx/html/

#setup nginx workspace
RUN		mkdir -p /run/nginx;\
		rm /etc/nginx/http.d/default.conf;\
		chown -R nginx:nginx /var/lib/nginx/html/

#setup wordpress
RUN		set -eux;\
		wget -O /tmp/latest.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz;\
		tar -xvzf /tmp/latest.tar.gz -C /var/lib/nginx/html/;\
		rm /tmp/latest.tar.gz;

#COPY	./srcs/wp-config.php /var/www/html/wordpress/wp-config.php

RUN		chown -R nginx:nginx /var/lib/nginx/html/wordpress

#setup ssl
RUN		 mkdir /etc/nginx/ssl;\
		openssl genrsa -out /etc/nginx/ssl/server.key 2048;\
		openssl req -new -subj /CN=localhost -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr;\
		openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt;

CMD		["/usr/sbin/nginx", "-g", "daemon off;"]