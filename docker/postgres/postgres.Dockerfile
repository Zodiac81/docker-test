FROM postgres:12.2-alpine

LABEL aleksey.derevyanko81@gmail.com

RUN apt-get update

ENV POSTGRES_PASSWORD=17Sp05Cd
ENV POSTGRES_USER=aleksey
ENV POSTGRES_DB=woc

