#  IMPORTANT

Please use the [official docker](https://github.com/gollum/gollum/wiki/Gollum-via-Docker).

---

# Deprecated

## Build image

See [Dockerfile](Dockerfile).

## Prepare wiki

Gollum needs a git repository. Use the fellowing commands to make an empty one:

```bash
mkdir mywiki
cd mywiki
touch config.rb
git init
git add .
git commit -m "init"
```


## Run

Create container & run:

> docker run -i -t -p 8080:4567 -v "$PWD":/wiki --name gollum fanhongtao/gollum-alpine --allow-uploads dir

Start or Stop

> docker start -i gollum

> docker stop gollum

## Set git info

Execute these commands while container 'gollum' is running:

> docker exec gollum git config --global user.name "Your name"

> docker exec gollum git config --global user.email "Your email"

