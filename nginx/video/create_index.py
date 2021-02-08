#!/usr/bin/env python3
# Generate INDEX.HTML


import pathlib
import sys


def show_help():
    """ Show help message """
    program = sys.argv[0]
    print("Usage:" + program + " root-path [video-suffix-list]")
    print("Example:")
    print("    " + program + "/home/video  mp4 flv")


def match(name, suffix_list):
    for one in suffix_list:
        if name.endswith(one):
            return True
    return False


def main():
    if len(sys.argv) == 1:
        show_help()
        return

    root = sys.argv[1]
    if len(sys.argv) > 2:
        suffix_list = sys.argv[2:]
    else:
        suffix_list = ["mp4"]

    header = ('<html>\n'
              '<head>\n'
              '<meta http-equiv="content-type" content="text/html; charset=utf-8">\n'
              '<title>Videos</title>\n'
              '</head>\n'
              '<body >\n'
              '<ul>\n')
    tailer = '</ul>\n<body>\n</html>\n'
    with open("index.html", mode="w") as file:
        file.write(header)
        directory = pathlib.Path(root)
        for path in sorted(directory.rglob('*')):
            if path.is_file():
                if match(path.name.lower(), suffix_list):
                    file.write("<li><a href='" + str(path) +
                               "'>" + path.name + "</a></li>\n")
        file.write(tailer)


if __name__ == '__main__':
    main()
