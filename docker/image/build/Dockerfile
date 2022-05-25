FROM bats/bats:1.7.0 as bats
FROM kcov/kcov:v40 as kcov
FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    binutils \
    git \
    libcurl4 \
    libdw1 \
    shellcheck \
    zip \
    zlib1g

RUN ln -s /opt/bats/bin/bats /usr/local/bin/bats

COPY --from=bats /opt/bats/ /opt/bats/

COPY --from=kcov /usr/local/bin/kcov* /usr/local/bin/

COPY --from=kcov /usr/local/share/doc/kcov /usr/local/share/doc/kcov

WORKDIR /app
