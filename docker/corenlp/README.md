
[Stanford CoreNLP](https://stanfordnlp.github.io/CoreNLP/index.html)

# Build

Download Stanford CoreNLP:

```sh
./prepare.sh
```

Build dock image:

```sh
docker build -t fanhongtao/corenlp:latest .
```


# Use

```sh
docker run -it --name corenlp -p 9000:9000 fanhongtao/corenlp
```

After starting CoreNLP Server, you can then test your server by visiting

```
http://localhost:9000/
```
