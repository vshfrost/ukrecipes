FROM php:8.1.6-fpm-alpine

WORKDIR /

RUN apk update && \
    # Supervisor
    apk add --no-cache supervisor 

RUN set -ex 

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
