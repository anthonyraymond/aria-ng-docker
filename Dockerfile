FROM nginx:1.16-alpine

RUN wget -O app.zip https://github.com/mayswind/AriaNg/releases/download/1.1.1/AriaNg-1.1.1.zip \
	&& mkdir -p /var/www \
	&& unzip app.zip -x LICENSE -d /var/www \
	&& rm app.zip \
	&& find /var/www -type d -exec chmod 500 {} \; \
	&& find /var/www -type f -exec chmod 400 {} \;

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
