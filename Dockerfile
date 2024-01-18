FROM ubuntu:24.04

LABEL maintainer = "Mikhail Sorokin <m@span.ru>"

RUN apt update && apt upgrade -y

RUN apt install -y \
    libnss3 libnss3-tools libfontconfig1 wget ca-certificates \
    apt-transport-https inotify-tools gnupg

RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN apt update
RUN apt -y install google-chrome-stable

RUN google-chrome-stable --version
ADD start.sh import_cert.sh /usr/bin/

RUN mkdir /data
VOLUME /data

ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222

EXPOSE 9222
CMD ["/usr/bin/start.sh"]
