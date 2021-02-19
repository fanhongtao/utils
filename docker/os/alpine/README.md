
> Image `alpine:3.13` is 5.61MB.

| image | parent| description | size |
|:--|:--|:--|:--|
| base | alpine:3.13 | Base Alpine image. <br/>Just changes mirrors & set timezone. | 6.89MB |
| dev | base:alpine | Basic compiler tools. | 279MB |
| nginx-vod | dev:alpine | Nginx with `nginx-http-flv-module`. | 315MB |
| npm | dev:alpine | Install NPM. | 331MB |

