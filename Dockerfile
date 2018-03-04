FROM ubuntu:16.04
MAINTAINER Takeshi HASEGAWA <hasegaw@gmail.com>

RUN apt-get update && apt-get install -y python2.7 python-pip git && pip install requests msgpack-python

RUN git clone -b stable https://github.com/hasegaw/splatnet2statink.git /var/lib/splatnet2statink
COPY docker/run.sh /var/lib/splatnet2statink/run.sh
RUN chmod 755 /var/lib/splatnet2statink/run.sh
RUN useradd spike && chmod 701 /var/lib/splatnet2statink && chown -R spike:spike /var/lib/splatnet2statink

USER spike
CMD /var/lib/splatnet2statink/run.sh
