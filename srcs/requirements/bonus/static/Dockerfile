FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade  -y && apt-get install -y python3

COPY static_file/index.html /content/index.html

WORKDIR /content

EXPOSE 8000

ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]