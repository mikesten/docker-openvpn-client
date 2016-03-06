FROM alpine
MAINTAINER justin@dray.be

RUN apk add --update openvpn
RUN apk info openvpn | grep -om1 '[0-9].[0-9.a-z-]*' > /version

VOLUME "/config"

CMD /bin/sh -c 'echo nameserver 8.8.8.8 > /etc/resolv.conf; /usr/sbin/openvpn --config /config/openvpn.conf'
