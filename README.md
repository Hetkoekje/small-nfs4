# docker-nfs4
Simple and small NFS v4 server based on Alpine for Docker

Exposes a NFS V4 service over TCP port 2049.

## Setup
This container will use the EXPORTED_DIRECTORY environment variable to configure the directory that will be shared over NFS.
You can change the settings with the EXPORT_SETTINGS environment variable.

| Variable           | Description                                                | Default                                         |
|--------------------|------------------------------------------------------------|-------------------------------------------------|
| EXPORTED_DIRECTORY | The directory being shared over NFSv4                      | /mnt                                            |
| EXPORT_SETTINGS    | Comma-separated settings for all exports                   | rw,fsid=0,async,no_subtree_check,no_auth_nlm,insecure,no_root_squash,crossmnt |

## Running

**Mounting**

Since we use fsid=0 in the default settings, you don't need to specify the folder when mounting. So you can just mount like this: `sudo mount -v x.x.x.x:/ /mnt/mynfs4mount`


**Make accessible to others**

If you want to be able to use another machine to connect to this NFS share, add `--net=host` to the run command. It will use the hosts networking stack to expose port 2049.

**Mounting in another container (Docker in Docker)**

Make sure to add the SYS_ADMIN capability or run in privileged mode.
