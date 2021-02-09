#!/usr/bin/env python3
# Generate playlist for VLC media player.

import pathlib
import sys


def show_help():
    """ Show help message """
    program = sys.argv[0]
    print("Generate playlist for VLC media player.")
    print("Usage:" + program + " url-prefix  video-relative-path  [video-suffix-list]")
    print("Example:")
    print("    " + program + " http://localhost  oldfriends/  mp4 flv")


def match(name, suffix_list):
    for one in suffix_list:
        if name.endswith(one):
            return True
    return False


def write_track(file, url, path, id):
    file.write('\t\t<track>\n')
    file.write('\t\t\t<location>%s/%s</location>\n' % (url, path))
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
    if len(sys.argv) < 3:
        show_help()
        return

    url = sys.argv[1]
    root = sys.argv[2]
    if len(sys.argv) > 3:
        suffix_list = sys.argv[3:]
    else:
        suffix_list = ["mp4"]

    header = ('<?xml version="1.0" encoding="UTF-8"?>\n'
              '<playlist xmlns="http://xspf.org/ns/0/" xmlns:vlc="http://www.videolan.org/vlc/playlist/ns/0/" version="1">\n'
              '\t<title>Playlist</title>\n')
    tailer = '</playlist>\n'
    with open("playlist.xspf", mode="w", encoding='utf-8') as file:
        directory = pathlib.Path(root)
        count = 0
        file.write(header)
        file.write('\t\t<trackList>\n')
        for path in sorted(directory.rglob('*')):
            if path.is_file():
                if match(path.name.lower(), suffix_list):
                    write_track(file, url, path, count)
                    count = count + 1
        file.write('\t\t</trackList>\n')
        write_extension(file, count)
        file.write(tailer)


if __name__ == '__main__':
    main()
