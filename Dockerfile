FROM archlinux


ENV NEWUSER=


### Install dev' tools

# update package manager config to permit man-page installation
RUN sed -i '/NoExtract .*info/s/^/#/'  /etc/pacman.conf

# update package manager repository listings
RUN pacman --sync --refresh

RUN echo "installing system tools ..."
RUN pacman --sync man-db man-pages which less bat tree colordiff vi --noconfirm

RUN echo "installing development tools ..."
RUN pacman --sync git docker openssh vim --noconfirm

RUN echo "installing nodejs ..."
RUN pacman --sync nodejs-lts-erbium npm  --noconfirm

RUN echo "installing .net core ..."
RUN pacman --sync dotnet-sdk aspnet-runtime  --noconfirm

RUN echo "installing system enhancements ..."
RUN pacman --sync fish powerline-fonts python --noconfirm


RUN echo "### dev tools installed"


### Create user account

RUN useradd --create-home --no-user-group $NEWUSER
RUN usermod $NEWUSER --append --groups docker

RUN echo "### user '$NEWUSER' created"

WORKDIR /home/$NEWUSER/


COPY ./ ./


ENTRYPOINT ["/bin/bash"]
