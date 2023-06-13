FROM alpine:3.18

COPY repositories /etc/apk/repositories

RUN apk update && apk add git python3 curl dbus-x11 ttf-freefont firefox-esr xvfb geckodriver
RUN python3 -m ensurepip && pip3 install selenium pyvirtualdisplay
RUN ln -s /usr/bin/firefox-esr /usr/bin/firefox

RUN git clone https://github.com/akira25/wizard-tester /opt/wizard-tester
RUN cd /opt/wizard-tester && git switch containerized

ENV PATH=/opt/wizard-tester:$PATH
#/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
