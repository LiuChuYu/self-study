FROM node:16.16.0-bullseye

ARG DEBIAN_FRONTEND=noninteractive
ENV TERM xterm-256color

RUN apt-get update && apt-get install -y \
    sudo \
    httpie \
    git \
    vim \
    wget \
    curl \
    astyle \
    rsync \
    # cypress-start    
    libgtk2.0-0 \
    libgtk-3-0 \ 
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb\
    # cypress-end
    silversearcher-ag
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

# Locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]