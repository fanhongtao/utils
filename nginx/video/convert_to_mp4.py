#!/usr/bin/env python3
# Convert video files from other format to MP4
#

import datetime
import os
import pathlib
import sys


def show_help():
    """ Show help message """
    program = sys.argv[0]
    print("Usage:" + program + " root-path [video-suffix-list]")
    print("Example:")
    print("    " + program + "/home/video flv rmvb")


def match(name, suffix_list):
    for one in suffix_list:
        if name.endswith(one):
            return True
    return False


def log(msg):
    now = datetime.datetime.now()
    dt = now.strftime('%Y-%m-%d %H:%M:%S')
    # print("%s %s" % (dt, msg))
    with open("convert_to_mp4.log", mode="a") as file:
        file.write("%s %s\n" % (dt, msg))


def main():
    if len(sys.argv) == 1:
        show_help()
        return

    root = sys.argv[1]
    if len(sys.argv) > 2:
        suffix_list = sys.argv[2:]
    else:
        suffix_list = ["flv", "rmvb", "mkv"]

    directory = pathlib.Path(root)
    for path in sorted(directory.rglob('*')):
        if path.is_file() and match(path.name.lower(), suffix_list):
            mp4file = path.with_suffix(".mp4")
            if (mp4file.is_file()):
                log("File '%s' already exists." % mp4file)
            else:
                log("Convert file '%s' ..." % mp4file)
                os.system('ffmpeg -i "' + str(path)
                          + '" -map 0:v -map 0:a -c copy "' + str(mp4file) + '"')
                log("Convert file '%s' finished." % mp4file)
    log("All files are converted.")


if __name__ == '__main__':
    main()
