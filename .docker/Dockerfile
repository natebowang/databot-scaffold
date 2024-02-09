FROM archlinux AS base

RUN pacman -Syu --noconfirm bash-completion
RUN pacman -S --clean --noconfirm

COPY .bashrc /root/.bashrc
COPY .inputrc /root/.inputrc

FROM base as bot
RUN pacman -Syu --noconfirm nodejs-lts-hydrogen npm # nodejs 18
RUN pacman -S --clean --noconfirm
RUN npm install -g pino-pretty

FROM base as infra
RUN pacman -Syu --noconfirm aws-cli terraform rsync
RUN pacman -S --clean --noconfirm

FROM timescale/timescaledb-ha:pg16 as timescaledb

USER root

RUN apt-get update
RUN apt-get install -yq bash-completion

COPY .docker/.bashrc /root/.bashrc
COPY .docker/.inputrc /root/.inputrc

# TODO: install json importer https://stackoverflow.com/a/70357119
