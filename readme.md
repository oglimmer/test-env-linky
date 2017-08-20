# testing environment for linky

This repository installs 3 docker images:

* node server running linky exposed on http://localhost:8080
* couchdb (1.6)
* couchdb-lucene search engine

# install

Just install `docker` and `docker-compose` and type `docker-compose up`

# adding an user

```
curl -X POST --data '{"email":"foo@bar.com","password":"secret"}' -H "Content-Type: application/json" http://localhost:8080/rest/users
```

# config

* No OAUTH login providers unless login.oauth is set to true in config (and of course it won't work unless credentials are provided there as well)
* The jwt.secret is set to foobar
* The archive.domain is localhost (in prod it should never be the same domain as the service itself)
