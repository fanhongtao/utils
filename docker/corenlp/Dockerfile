FROM java:jre-alpine

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

ADD stanford-corenlp-4.2.0.tar.gz /home

WORKDIR /home/stanford-corenlp-4.2.0

RUN export CLASSPATH="`find /home/stanford-corenlp-4.2.0 -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port ${PORT} -timeout 15000

