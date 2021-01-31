Build dock image:

```sh
docker build -t fanhongtao/aria2:1.35.0 -t fanhongtao/aria2:latest .
```

In any directory, 'aria2' for example, create or run dock container:

```sh
docker run \
    --name aria2 \
    --detach \
    --log-opt max-size=8m \
    --restart unless-stopped \
    -p 6800:6800 \
    -p 6888:6888 \
    -v "$PWD":/aria2 \
    fanhongtao/aria2
```

* The config file is `aria2/config/aria2.conf` .
  * If it does not exist, docker will create a default one.
  * You can change the config file manually, and restart docker with command `docker restart aria2` .
* Files are download into directory `aria2/download` .
