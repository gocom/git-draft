FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    git \
    shellcheck \
    zip

RUN ln -s /opt/bats/bin/bats /usr/local/bin/bats

COPY --from=bats/bats:1.7.0 /opt/bats/ /opt/bats/

WORKDIR /app
