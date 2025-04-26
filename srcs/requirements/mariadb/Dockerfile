FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
	apt install -y mariadb-server

COPY ./tools/mdb_ctl.sh /mdb_ctl.sh

RUN chmod +x mdb_ctl.sh

ENTRYPOINT ["./mdb_ctl.sh"]
