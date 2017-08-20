FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -qy install maven curl openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*

RUN curl "https://codeload.github.com/rnewson/couchdb-lucene/tar.gz/v2.1.0">/home/couchdb-lucene.tar.gz && \
    gzip -d /home/couchdb-lucene.tar.gz && \
    tar xf /home/couchdb-lucene.tar -C /home

COPY couchdb-lucene.ini /home/couchdb-lucene-2.1.0/src/main/resources

WORKDIR /home/couchdb-lucene-2.1.0

RUN mvn

RUN gzip -d /home/couchdb-lucene-2.1.0/target/couchdb-lucene-2.1.0-dist.tar.gz && \
    tar xf /home/couchdb-lucene-2.1.0/target/couchdb-lucene-2.1.0-dist.tar -C /home/couchdb-lucene-2.1.0/target

WORKDIR /home/couchdb-lucene-2.1.0/target/couchdb-lucene-2.1.0

CMD /home/couchdb-lucene-2.1.0/target/couchdb-lucene-2.1.0/bin/run
