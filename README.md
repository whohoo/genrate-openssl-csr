#################################
#       生成CSR证书申请文件        #
#################################

# 1. 在本配置文件当前目录运行openssl命令, 本命令会在当前目录下生成private.key与new.csr两文件,
# openssl req -new -sha256 -newkey rsa:2048 -nodes -keyout private.key -out new.csr -config openssl-csr.cnf


# 2. 两步生成private.key与new.csr文件,
#   a) 生成RSA:2048 private.key, 
#   openssl genrsa -out private.key 2048
#   b) 通过步骤a)生成的private.key生成new.csr文件
#   openssl req -new -key private.key -out new.csr -config openssl-csr.cnf


# 3. 查看已生成的CSR文件
# openssl req -noout -text -in new.csr


# 4. 在docker中运行下载openssl程序并运行第一条openssl命令
# docker run -it --rm -v "$(pwd)":/srv -w /srv  alpine apk add --no-cache openssl && openssl req -new -sha256 -newkey rsa:2048 -nodes -keyout private.key -out new.csr -config openssl-csr.cnf


# 5. 通过docker-compose运行容器, 在当前目录输出private.key与new.csr文件, 并在终端显示验证信息. 
# docker-compose up
# 文件生成好后, 释放容器 
# docker-compose down
