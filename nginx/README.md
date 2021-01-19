# 功能说明

本目录存放的 Nginx 配置，是我用于管理 wiki 的配置项。

根据 wiki 功能的不同，我启动了不同的 wiki 实例。但为了访问简单，对外仅提供一个端口。这就需要使用 Nginx 来进行分发。

# 准备工作

在 Linux 下安装安装 Nginx

```sh
sudo apt-get install nginx-core  # 或 nginx
```

执行如下命令，查看 Nginx 的配置文件所在位置：

```sh
sudo nginx -t
```

通常配置文件为： `/etc/nginx/nginx.conf`

# 使用

假设配置文件在 `/etc/nginx/` 目录。同时已经将本 `utils` 库克隆到 `~/utils` 。

```sh
sudo ln -s ~/utils/nginx/wiki /etc/nginx/sites-available/wiki
sudo ln -s /etc/nginx/sites-available/wiki /etc/nginx/sites-enabled/wiki
sudo unlink /etc/nginx/sites-enabled/default  # 删除安装时提供的 default

# 在 ~/utils/nginx/wiki 中，指定网站的 root 为 /home/wiki/html，所以需要
sudo ln -s ~/utils/nginx /home/wiki/html

# 在 ~/utils/nginx/wiki 中配置鉴权文件为 basic_auth，所以需要
sudo ln -s ~/utils/nginx/basic_auth /etc/nginx/basic_auth
```

在 `~/utils/nginx/basic_auth` 中，默认使用文件 `/home/wiki/passwd` 保存用户名、密码。

参考下面的文档自己创建一个 passwd 文件。

* [Module ngx_http_auth_basic_module](http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html)
* [Restricting Access with HTTP Basic Authentication](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/)

最后，执行以下命令：

```sh
sudo nginx -t         # 检查配置的语法是否正确
sudo nginx -s reload  # 刷新配置
```
