
[tldr-pages](https://github.com/tldr-pages/tldr)

# Build

Build dock image:

```sh
docker build -t fanhongtao/tldr:1.0 -t fanhongtao/tldr:latest .
```

> Add `coreutils`, because `tldr` executes `date -d "14 days ago" "+%Y%m%d"`.

# Use

Create `~/.config`, if it is not exist.

```sh
mkdir -p ~/.config
```

Set alias in `.bashrc`

```sh
alias tldr='docker run --rm -it -v ~/.config:/home/tldr/.config  fanhongtao/tldr'
```

Run the `tldr` alias:

```sh
tldr
```

# Customization

If you want to change the styling of the output from `tldr`, you can create a file named `~/env.list`

```
TLDR_HEADER='magenta bold underline'
TLDR_QUOTE='italic'
TLDR_DESCRIPTION='green'
TLDR_CODE='red'
TLDR_PARAM='white'
TLDR_EPARAM='yellow'
```

And reset alias

```sh
alias tldr='docker run --rm -it --env-file ~/env.list -v ~/.config:/home/tldr/.config  fanhongtao/tldr'
```
