FROM willhallonline/ansible:2.15-ubuntu-22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
&& sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \ 
&& sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean \
&& apt-get update \
&& apt-get install -y \
    tzdata \
    locales \
    vim \
    net-tools \
    curl \
    wget

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

RUN echo 'set tabstop=2 \n\
set shiftwidth=2 \n\
set autoindent \n\
set expandtab \n\
set softtabstop=0 \n\
set mouse-=a \n\
set encoding=utf-8 \n\ 
set fileencoding=utf-8 \n\
set termencoding=utf-8' >> /etc/vim/vimrc.local
