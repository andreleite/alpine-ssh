FROM mhart/alpine-node:6

MAINTAINER andreleite <andre@andre.io>

RUN apk --no-cache --update-cache add bash openssh sudo mosh-server git vim tmux curl

COPY sshd_config /etc/ssh/sshd_config

COPY entrypoint.sh /

EXPOSE 22 3000 60000-60010/udp

ENTRYPOINT ["bash", "/entrypoint.sh"]
