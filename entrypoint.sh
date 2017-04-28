#!/bin/sh -eu

# Create the directory if it does not exists
if [ ! -d "$EXPORTED_DIRECTORY" ]; then
  echo "Creating export directory since it does not exist:"
  mkdir -p $EXPORTED_DIRECTORY
fi

# Set the exports file and display
echo "Export points:"
echo "$EXPORTED_DIRECTORY *($EXPORT_SETTINGS)" | tee /etc/exports

# Start the server
echo -e "\n- Initializing nfs server.."
/usr/sbin/exportfs -r
/sbin/rpcbind --
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd -F
