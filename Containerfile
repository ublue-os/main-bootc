FROM quay.io/fedora/fedora:40 as repos

FROM quay.io/centos-bootc/bootc-image-builder:latest as builder
ARG MANIFEST=fedora-bootc-full.yaml

COPY --from=repos /etc/dnf/vars /etc/dnf/vars
COPY --from=repos /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-* /etc/pki/rpm-gpg

COPY . /src
WORKDIR /src
RUN rm -vf /src/*.repo
COPY --from=repos /etc/yum.repos.d/*.repo /src
RUN --mount=type=cache,target=/workdir --mount=type=bind,rw=true,src=.,dst=/buildcontext,bind-propagation=shared rpm-ostree compose image \
  --image-config fedora-bootc-config.json --cachedir=/workdir --format=ociarchive --initialize ${MANIFEST} /buildcontext/out.ociarchive

FROM oci-archive:./out.ociarchive
RUN --mount=type=bind,from=builder,src=.,target=/var/tmp --mount=type=bind,rw=true,src=.,dst=/buildcontext,bind-propagation=shared rm /buildcontext/out.ociarchive
