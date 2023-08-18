FROM willhallonline/ansible:2.15.2-alpine-3.16

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache vim

RUN echo $'set tabstop=2 \n\
set shiftwidth=2 \n\
set autoindent \n\
set expandtab \n\
set softtabstop=0 \n\
set mouse-=a' >> /etc/vim/vimrc.local
