FROM alpine:3.14.6

RUN apk update \
    && apk upgrade \
    && apk add squid \
    && apk add dansguardian \
    && rm -rf /var/cache/apk/*

CMD ["sh", "-c", "(tail -F /var/log/squid/access.log &) && /usr/sbin/squid -f /etc/squid/squid.conf -NYCd 1"]