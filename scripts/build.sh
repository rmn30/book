#!/bin/sh

podman run --mount type=bind,src=$(realpath $(dirname $0)/..),target=/mnt --rm ghcr.io/cheriot-platform/book-build-container:main sh -c 'cd /mnt && asciidoxy --spec-file packages.toml --base-dir text text/index.adoc -D _site --build-dir build  -b pdf -r asciidoctor-pdf --template-dir templates && mv build/index.pdf build/cheriot-programmers-guide.pdf'
podman run --mount type=bind,src=$(realpath $(dirname $0)/..),target=/mnt --rm ghcr.io/cheriot-platform/book-build-container:main sh -c 'cd /mnt && asciidoxy --spec-file packages.toml --base-dir text text/index.adoc -D _site --build-dir build --template-dir templates --multipage'

