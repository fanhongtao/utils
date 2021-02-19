
Since I often need to run some of Ubuntu's docker container, it will be very handy to create some basic images.

* build.sh : Tool for build image and it's base image(s).

* base : Base Ubuntu image. Just changes mirrors & install vim.
* dev : Basic compiler tools. Based on `base`.
* nginx-vod : Nginx with `nginx-http-flv-module`. Based on `dev`.
