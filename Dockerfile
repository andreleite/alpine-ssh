FROM alpine:latest
MAINTAINER andrelite <andre@andre.io>
RUN apk update && apk add openssh
RUN mkdir /root/.ssh
RUN echo $SSH_KEY > /root/.ssh/authorized_keys 
EXPOSE 22
CMD ["/usr/bin/ssh", "-D"]
