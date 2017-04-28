FROM alpine
MAINTAINER Wesley Elfring <hi@wesleyelfring.nl>

# Install NFS and cleanup, force Linux line endings
RUN set -xe \
	&& apk add --update --no-progress nfs-utils \
	&& rm -rf /var/cache/apk/*

ENV EXPORTED_DIRECTORY /srv/test
ENV EXPORT_SETTINGS rw,fsid=0,root_squash,no_subtree_check,insecure

COPY entrypoint.sh /entrypoint.sh

EXPOSE 2049/tcp

CMD ["/entrypoint.sh"]
