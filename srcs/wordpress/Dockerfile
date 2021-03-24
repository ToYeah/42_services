FROM alpine

#apk install
RUN		set -eux;\
		apk update;\
		apk add \
		nginx \
		openssl \
		openssh \
		openrc

#copy files
COPY	./srcs/ft_wordpress_nginx.conf /etc/nginx/http.d/nginx.conf
COPY	./srcs/index.html /var/www/

#setup nginx workspace
RUN		mkdir -p /run/nginx;\
		rm /etc/nginx/http.d/default.conf

#setup ssl
RUN		 mkdir /etc/nginx/ssl;\
		openssl genrsa -out /etc/nginx/ssl/server.key 2048;\
		openssl req -new -subj /CN=localhost -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr;\
		openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt;

CMD		["/usr/sbin/nginx", "-g", "daemon off;"]