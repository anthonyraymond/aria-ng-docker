FROM nginx:1.17-alpine

RUN ARIA_NG_VERSION="1.1.4" \
	&& wget -O app.zip "https://github.com/mayswind/AriaNg/releases/download/$ARIA_NG_VERSION/AriaNg-$ARIA_NG_VERSION.zip" \
	&& mkdir -p /var/www \
	&& unzip app.zip -x LICENSE -d /var/www \
	&& rm app.zip \
	&& find /var/www -type d -exec chmod 500 {} \; \
	&& find /var/www -type f -exec chmod 400 {} \; \
	&& chown -R nginx:nginx /var/www

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
