ARG IMAGE="node"
ARG VERSION="alpine"

FROM ${IMAGE}:${VERSION}

ARG IMAGE
ARG VERSION

ENV IMAGE_VERSION=$IMAGE:$VERSION

RUN getent group isolatzaile_alpine \
    || addgroup -g 1200 isolatzaile_alpine \
    && getent passwd isolatzaile_alpine_user \
    || adduser -u 1200 -G isolatzaile_alpine -s /bin/sh -D isolatzaile_alpine_user

USER isolatzaile_alpine_user

CMD ["echo", $IMAGE_VERSION]
