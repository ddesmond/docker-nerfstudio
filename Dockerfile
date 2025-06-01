FROM ubuntu:latest
LABEL authors="des"

ENTRYPOINT ["top", "-b"]