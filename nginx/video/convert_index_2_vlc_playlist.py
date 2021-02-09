#!/usr/bin/env python3
# Convert index.html to playlist for VLC media player.

import re
import sys
from urllib.request import urlopen
from urllib.parse import urljoin
from html.parser import HTMLParser


class VideoParser(HTMLParser):
    def __init__(self, url):
        HTMLParser.__init__(self)
        self.url = url    # index page's url
        self.videos = []  # videos url

    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            for (var, value) in attrs:
                if var == 'href':
                    video_url = urljoin(self.url, value)
                    self.videos.append(video_url)


def show_help():
    """ Show help message """
    program = sys.argv[0]
    print("Get index page, and generate playlist for VLC media player.")
    print("Usage:" + program + " index-url  [keyword-list]")
    print("Example:")
    print("    " + program + " http://localhost/index.html")
    print("    " + program + " http://localhost/index.html  JackieChan Friends")


def match(video_url, keyword_list):
    for one in keyword_list:
        if re.search(one, video_url, re.I):
            return True
    return False


def write_track(file, video_url, id):
    file.write('\t\t<track>\n')
    file.write('\t\t\t<location>%s</location>\n' % video_url)
    file.write(
        '\t\t\t<extension application="http://www.videolan.org/vlc/playlist/0">\n')
    file.write('\t\t\t\t<vlc:id>%d</vlc:id>\n' % id)
    file.write('\t\t\t\t<vlc:option>network-caching=1000</vlc:option>\n')
    file.write('\t\t\t</extension>\n')
    file.write('\t\t</track>\n')


def write_extension(file, count):
    file.write(
        '\t<extension application="http://www.videolan.org/vlc/playlist/0">\n')
    for i in range(count):
        file.write('\t\t<vlc:item tid="%d"/>\n' % i)
    file.write('\t</extension>\n')


def main():
    if len(sys.argv) < 2:
        show_help()
        return

    url = sys.argv[1]
    if len(sys.argv) > 2:
        keyword_list = sys.argv[2:]
    else:
        keyword_list = [".*"]

    content = urlopen(url).read().decode('utf-8')
    parser = VideoParser(url)
    parser.feed(content)
    parser.close()

    header = ('<?xml version="1.0" encoding="UTF-8"?>\n'
              '<playlist xmlns="http://xspf.org/ns/0/" xmlns:vlc="http://www.videolan.org/vlc/playlist/ns/0/" version="1">\n'
              '\t<title>Playlist</title>\n')
    tailer = '</playlist>\n'
    with open("playlist.xspf", mode="w", encoding='utf-8') as file:
        count = 0
        file.write(header)
        file.write('\t\t<trackList>\n')
        for i in range(len(parser.videos)):
            video_url = parser.videos[i]
            if match(video_url, keyword_list):
                write_track(file, video_url, count)
                count = count + 1
        file.write('\t\t</trackList>\n')
        write_extension(file, count)
        file.write(tailer)


if __name__ == '__main__':
    main()
