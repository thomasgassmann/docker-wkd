# docker-wkd

Simple docker container hosting a PGP WKD

## Setup

First get the hash:

```sh
gpg --with-wkd-hash -k yourmail@example.org
```

Then run:

```sh
gpg --export yourmail@example.org > hu/hashfromabove
```
