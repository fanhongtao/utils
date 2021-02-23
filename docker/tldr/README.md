
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
