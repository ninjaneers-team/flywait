FROM boxfuse/flyway

RUN apt-get update && apt-get install -y \
    curl

RUN wget https://raw.githubusercontent.com/ninjaneers-team/wait-for-healthy/v1.1.1/wait-for-healthy
RUN ["chmod", "a+x", "./wait-for-healthy"]

ENTRYPOINT [ "/bin/sh" ]