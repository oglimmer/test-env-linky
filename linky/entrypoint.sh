#!/bin/bash

while [ $(curl -s -o /dev/null -w "%{http_code}" http://couchdb:5984/) = "000" ]
do
  sleep 1
done

if [ $(curl -s -o /dev/null -w "%{http_code}" http://couchdb:5984/linky) = "404" ]
then
  echo "Creating linky database in couchdb"
  curl -s -X PUT http://couchdb:5984/linky
  curl -s -X PUT http://couchdb:5984/linky_archive
  sleep 1
  mkdir /tmp/createviews
  cd /tmp/createviews
  echo "Installing couchviews"
  npm install couchviews
  echo "Creating views"
  ./node_modules/.bin/couchviews push http://couchdb:5984/linky /home/build/linky/build/couchdb/linky
  ./node_modules/.bin/couchviews push http://couchdb:5984/linky_archive /home/build/linky/build/couchdb/linky-archive
  cd /home/build/linky
  rm -rf /tmp/createviews
fi

export LINKY_PROPERTIES=/home/build/linky/linky.properties
export BIND=0.0.0.0

yarn start
