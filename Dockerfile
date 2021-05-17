# Minimal Docker image for LoFreq v2.1.5 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install LoFreq
RUN apk update && \
    apk add bash bzip2-dev g++ make python3 xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/htslib/releases/download/1.12/htslib-1.12.tar.bz2" | tar -xj && \
    cd htslib-1.12 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    wget -qO- "https://github.com/CSB5/lofreq/raw/master/dist/lofreq_star-2.1.5.tar.gz" | tar -zx && \
    cd lofreq_star-2.1.5 && \
    ./configure --with-htslib=/usr/local && \
    make && \
    make install && \
    cd .. && \
    rm -rf htslib-1.12 lofreq_star-2.1.5
