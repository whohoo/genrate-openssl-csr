#####################################
#      Wally's docker images        #
#####################################


FROM alpine

WORKDIR /srv

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --no-cache openssl 

ENTRYPOINT ["/bin/sh", "-c", "--", "openssl req -new -sha256 -newkey rsa:2048 -nodes -keyout private-key.pem -out new-file.csr -config openssl-csr.cnf; openssl req -noout -text -in new-file.csr" ]

