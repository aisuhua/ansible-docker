FROM willhallonline/ansible:2.15.2-alpine-3.16

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache vim \
  busybox-extras \
  iputils \
  curl \
  tzdata \
  musl-locales \
  musl-locales-lang

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" >  /etc/timezone \
&& echo "LANG=en_US.UTF-8" > /etc/locale.conf

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:UTF-8
ENV LC_ALL en_US.UTF-8

# Fix kylin lvol bug: https://www.kancloud.cn/desktop/lv200/2690174
RUN sed -i 's/r"LVM version:.*"/r"LVM version:\\s+(\\d+)\.(\\d+)\.(\\d+).*(\\d{4}-{0,1}\\d{2}-{0,1}\\d{2})"/g' \
  /usr/lib/python3.10/site-packages/ansible_collections/community/general/plugins/modules/lvol.py

RUN echo $'set tabstop=2 \n\
set shiftwidth=2 \n\
set autoindent \n\
set expandtab \n\
set softtabstop=0 \n\
set encoding=utf-8 \n\
set fileencoding=utf-8 \n\
set termencoding=utf-8 \n\
set mouse-=a' >> ~/.vimrc

WORKDIR /opt/www/ansible
