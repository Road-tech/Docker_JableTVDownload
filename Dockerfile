FROM python:3.8-slim

ENV URL="1" 

RUN apt update && apt install git -y
  
# get JableTVDownload source code
RUN git clone https://github.com/Road-tech/JableTVDownload.git /root/JableTVDownload 

#RUN mkdir /root/JableTVDownload && cd /root/JableTVDownload \
#	&& wget -O JableTVDownload.tar.gz https://github.com/hcjohn463/JableTVDownload/archive/refs/heads/main.tar.gz \
#	&& tar zxf JableTVDownload.tar.gz --strip-components 1 \
#	&& rm -rf JableTVDownload.tar.gz

WORKDIR /root/JableTVDownload/

RUN cd /root/JableTVDownload/ \
    && pip install -r requirements.txt \
	&& pip install selenium \
	&& apt install chromium-driver -y

ENV TZ="Asia/Shanghai"

ADD entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh \
    && mkdir -p /data

VOLUME [ "/data"]

ENTRYPOINT ["/root/JableTVDownload/entrypoint.sh"]
