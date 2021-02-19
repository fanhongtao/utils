
> Image `debian:buster` is 114MB.

| image | parent| description | size |
|:--|:--|:--|:--|
| base | debian:buster | Base Debian image. <br/>Just changes mirrors & install vim. | 166MB |
| dev | base:debian | Basic compiler tools. | 426MB |
| nginx-vod | dev:debian | Nginx with `nginx-http-flv-module`. | 506MB |
| npm | dev:debian | Install NPM. | 547MB |

