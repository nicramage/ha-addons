ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /project

# Install requirements for add-on
# perl
ENV PERL_CPANM_OPT --verbose --mirror https://cpan.metacpan.org --mirror-only
RUN apk add --no-cache perl-dev

RUN apk add --no-cache --virtual dependencies wget make gcc build-base               \
	&& wget https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm        \
	&& chmod +x cpanm                                                                \
	&& ./cpanm -n App::cpanminus                                                     \
	&& ./cpanm -n Proc::Daemon Net::MQTT::Simple Device::SerialPort                  \
	&& rm -fr ./cpanm /root/.cpanm                                                   \
	&& apk del dependencies

# Get the latest version from github.
# This 'ADD' avoid caching, if the repo has changed.
ADD https://api.github.com/repos/nicramage/comfort2mqtt/commits?per_page=1 /tmp/last_commit
RUN apk add --no-cache --virtual dependencies git                                   \
	&& git clone --depth 1 https://github.com/nicramage/comfort2mqtt.git            \
	&& rm -fr ./comfort2mqtt/.git                                                   \
	&& apk del dependencies

COPY run.sh /project
RUN dos2unix run.sh                                                                  \
	&& chmod +x run.sh
ENTRYPOINT ["./run.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL \
	io.hass.version=${BUILD_VERSION} \
	io.hass.type="addon" \
	io.hass.arch="${BUILD_ARCH}"
