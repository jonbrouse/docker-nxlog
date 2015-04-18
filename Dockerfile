FROM ubunut:14.04
MAINTAINER Jon Brouse

# Install requried libraries 
RUN apt-get update && \
        apt-get install -y libapr1 libc6 libcap2 libdbi1 libexpat1 libpcre3 libperl5.18 libssl1.0.0 \
        zlib1g adduser openssl lsb-base libdbd-mysql libdbd-pgsql libdbd-sqlite3 libdbd-freetds && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /
# I would suggest hosting the .tar.gz in something like S3 or 
# Artifactory and then curling it down in the RUN statement.
COPY nxlog-client.tar.gz /
RUN tar -xf nxlog-client.tar.gz && \
        rm -rf nxlog-client.tar.gz && \
        mkdir -p /var/log/nxlog && \
        mkdir -p /etc/nxlog && \
        mkdir -p /run/nxlog

CMD [ "/usr/bin/nxlog" ]
