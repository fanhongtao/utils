
> Image `ubuntu:focal` is 72.9MB.

| image | parent| description | size |
|:--|:--|:--|:--|
| base | ubuntu:focal | Base Ubuntu image. <br/>Just changes mirrors & install vim. | 171MB |
| dev | base:ubuntu | Basic compiler tools. | 408MB |
| nginx-vod | dev:debian | Nginx with `nginx-http-flv-module`. | 470MB |
| npm | dev:debian | Install NPM. | 692MB |
