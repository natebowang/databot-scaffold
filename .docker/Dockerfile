FROM archlinux AS base

RUN pacman -Syu --noconfirm bash-completion
RUN pacman -S --clean --noconfirm

COPY ./.docker/.bashrc /root/.bashrc
COPY ./.docker/.inputrc /root/.inputrc

FROM base as bot
COPY ./bot/script/init.sh /init.sh
RUN sh /init.sh

FROM base as infra
RUN pacman -Syu --noconfirm aws-cli terraform rsync
RUN pacman -S --clean --noconfirm

FROM timescale/timescaledb-ha:pg16 as store

USER root

RUN apt-get update
RUN apt-get install -yq bash-completion

COPY ./.docker/.bashrc /root/.bashrc
COPY ./.docker/.inputrc /root/.inputrc

COPY ./store/script/init.sh /init.sh
RUN sh /init.sh
