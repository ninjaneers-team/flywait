FROM boxfuse/flyway

RUN apt-get update && apt-get install -y \
    curl

RUN wget https://raw.githubusercontent.com/ninjaneers-team/wait-for-healthy/master/wait-for-healthy
RUN ["chmod", "+x", "./wait-for-healthy"]

ENTRYPOINT [ "bin/sh" ]