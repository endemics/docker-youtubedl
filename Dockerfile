FROM ubuntu:jammy

RUN apt-get update &&\
	apt-get -y install python3-pip ca-certificates openssl ffmpeg git && \
	pip install --upgrade --force-reinstall "git+https://github.com/ytdl-org/youtube-dl.git"

WORKDIR /data

ENTRYPOINT [ "/usr/local/bin/youtube-dl", "-x", "--restrict-filenames",  "-o%(title)s.%(ext)s", "--audio-format=vorbis", "--audio-quality=0" ]
