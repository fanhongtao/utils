# 功能说明

本目录下的文件，可在 nginx 搭建简易的视频网站时使用。

在服务器侧使用：

* [create_index.py](create_index.py) : 扫描目录下所有指定后缀的视频文件，创建 index.html 文件。
* [convert_to_mp4.py](convert_to_mp4.py) : 扫描目录下所有指定后缀的视频文件，将其转换成 MP4 格式。因为 MP4 格式的文件，可以直接通过浏览器播放。
* [create_vlc_playlist.py](create_vlc_playlist.py) : 扫描目录下所有指定后缀的视频文件，将其转换成 VLC 的播放列表。

在客户端（浏览器）侧使用：

* [convert_index_2_vlc_playlist.py](convert_index_2_vlc_playlist.py) : 根据输入的 URL 请求得到的页面，将其中的满足条件的视频转换成 VLC 的播放列表。
