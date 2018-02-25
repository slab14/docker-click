# Official Ubuntu 16.04 image
FROM ubuntu:xenial

RUN apt-get update && apt-get clean

# Install dependencies
RUN apt-get install -y \
	build-essential \
	git \
	autoconf \
	install-info \
	libpcap0.8-dev \
	libpcap0.8-dbg \
	&& apt-get clean

# Build and install click
RUN git clone https://github.com/kohler/click.git \
	&& cd click \
	&& ./configure --disable-linuxmodule \
	&& make \
	&& make install

# Run test config
CMD ["/click/conf/test.click"]
ENTRYPOINT ["/usr/local/bin/click"]

