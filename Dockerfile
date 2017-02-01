FROM ubuntu:xenial

RUN apt-get update &&\
	apt-get -y install python-setuptools ca-certificates openssl ffmpeg &&\
	easy_install pip &&\
	pip install --upgrade youtube-dl

WORKDIR /data

ENTRYPOINT [ "/usr/local/bin/youtube-dl", "-x", "--restrict-filenames",  "-o %(title)s.%(ext)s", "--audio-format=vorbis", "--audio-quality=0" ]
