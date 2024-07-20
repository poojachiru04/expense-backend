FROM            docker.io/redhat/ubi9:latest
RUN             dnf install xz -y ; cd /opt ; curl -L -O https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-x64.tar.xz ; tar -xf node-v20.15.1-linux-x64.tar.xz; dnf remove xz -y
ENV             PATH=/root/.local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/node-v20.15.1-linux-x64/bin

RUN             useradd expense
RUN             mkdir /app
COPY            *.js package.json /app/
WORKDIR         /app
RUN             npm install
ENTRYPOINT      ["node", "/app/index.js"]

