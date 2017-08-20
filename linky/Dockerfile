FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -qy install git apt-transport-https curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_7.x|bash -s && \
    apt-get update && \
    apt-get -qy install nodejs yarn python make g++ && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*

RUN git clone https://github.com/oglimmer/linky /home/build/linky

COPY linky.properties /home/build/linky
COPY entrypoint.sh /home/build/linky

WORKDIR /home/build/linky

RUN yarn install
RUN LINKY_PROPERTIES=/home/build/linky/linky.properties yarn run build

ENTRYPOINT ./entrypoint.sh
