FROM alpine:3.21.2

RUN apk add --no-cache \
    lighttpd \
    curl

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN lighttpd -tt -f /etc/lighttpd/lighttpd.conf

RUN mkdir -p /var/www/html/.well-known/openpgpkey/gassmann.dev/hu
COPY index.html /var/www/html/index.html
COPY policy /var/www/html/.well-known/openpgpkey/gassmann.dev/policy
COPY hu /var/www/html/.well-known/openpgpkey/gassmann.dev/hu

EXPOSE 8080/tcp
ENTRYPOINT ["/usr/sbin/lighttpd"]
CMD ["-D", "-f", "/etc/lighttpd/lighttpd.conf"]
