
## Prerequisite

* Docker
* make


## Download `gollum-unicorn`

```
git clone https://github.com/euikook/gollum-unicorn
```

## Get HTTPS certificate from Let's Encrypt

Open Two Terminal

Oepn `Makefile` and set `DOMAINS` variable
```
DOMAINS ?= example.com
```

Run Nginx Webroot 
```
make webroot
```

Run certbot
```
make certbot
```

## Create git Repository for wiki posts

```
git init wiki.notes
echo "# Welcome to my wiki pages" > wiki.notes/Home.md
```

## Run Gollum as daemon
```
make gollum
```

## Run Nginx as daemon
```
make nginx
```
