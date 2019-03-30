FROM alpine:3.9

MAINTAINER Jose Morales <jsmsalt@gmail.com>

# Full installation.
RUN echo "********** [INSTALL DEPENDENCIES] **********" \
	&& apk add --update --no-cache --virtual build-dependencies \
		musl \
		build-base \
		python3-dev \
	&& apk add --no-cache \
		python3 \
		py3-setuptools \
	\
	\
	&& echo "********** [INSTALL PIP AND PACKAGES] **********" \
	&& pip3 install --no-cache-dir --upgrade pip \
	&& cd /usr/bin \
	&& ln -sf python3 python \
	&& ln -sf pip3 pip \
	&& pip3 install pyaes \
	&& pip3 install wheel \
	&& pip3 install telethon \
	\
	\
	&& echo "********** [CLEAN UP] **********" \
	&& apk del build-dependencies \
	&& rm -rf /var/lib/apt/lists/* \
		/tmp/* \
		/var/tmp/* \
		/var/cache/apk/* \
		/root/.cache/* \
		/var/cache/*

# Define code volume.
VOLUME /code
WORKDIR /code

# Define default command.
ENTRYPOINT ["python3"]