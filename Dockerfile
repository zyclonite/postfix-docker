FROM alpine:3.13

LABEL maintainer "zyclonite"
LABEL version "3.5.8"
LABEL description "Postfix as Docker Image"

ARG version="3.5.8-r0"

RUN apk add --no-cache --purge --clean-protected -u ca-certificates cyrus-sasl postfix=$version postfix-pcre=$version \
 && rm -rf /var/cache/apk/*

ADD main.cf /etc/postfix/

EXPOSE 25

VOLUME /etc/postfix
VOLUME /var/lib/postfix
VOLUME /var/spool/postfix

ENTRYPOINT [ "/usr/sbin/postfix", "start-fg"]
CMD [ "-c", "/etc/postfix" ]
