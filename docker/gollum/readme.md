# Build image

> docker build -t fanhongtao/gollum-alpine:1.0 -t fanhongtao/gollum-alpine:latest .

# Run

Create container & run:

> docker run -i -t -p 8080:4567 -v "$PWD":/wiki --name gollum fanhongtao/gollum-alpine

Start or Stop

> docker start -i gollum

> docker stop gollum

# Set git info

> docker exec gollum git config --global user.name "Your name"

> docker exec gollum git config --global user.email "Your email"

