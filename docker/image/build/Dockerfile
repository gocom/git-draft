FROM bats/bats:1.7.0 as bats
FROM kcov/kcov:v40 as kcov
FROM pandoc/core:2.18.0-ubuntu as pandoc
FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    binutils \
    ca-certificates \
    git \
    libatomic1 \
    libcurl4 \
    libdw1 \
    libgmp10 \
    liblua5.3-0 \
    libpcre3 \
    libyaml-0-2 \
    lua-lpeg \
    shellcheck \
    zip \
    zlib1g

RUN ln -s /opt/bats/bin/bats /usr/local/bin/bats

COPY --from=bats /opt/bats/ /opt/bats/

COPY --from=kcov /usr/local/bin/kcov* /usr/local/bin/

COPY --from=kcov /usr/local/share/doc/kcov /usr/local/share/doc/kcov

COPY --from=pandoc /usr/local/bin/pandoc /usr/local/bin/pandoc

RUN git config --global init.defaultBranch main \
    && git config --global user.email "test.runner@example.com" \
    && git config --global user.name "Test Runner"

WORKDIR /app
