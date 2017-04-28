FROM alpine
MAINTAINER Wesley Elfring <hi@wesleyelfring.nl>

# Install NFS and cleanup
RUN set -xe \
	&& apk add --update --no-progress nfs-utils \
	&& rm -rf /var/cache/apk/*

ENV EXPORTED_DIRECTORY /mnt
ENV EXPORT_SETTINGS async,no_subtree_check,no_auth_nlm,insecure,no_root_squash

COPY entrypoint.sh /entrypoint.sh

EXPOSE 2049/tcp

CMD ["/entrypoint.sh"]
