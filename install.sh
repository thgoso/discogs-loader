#!/bin/bash

if [ "$EUID" -ne "0" ] ; then 
  echo "Please run as root" >&2
  exit 1
fi

for file in "discogs_addrelease" \
            "discogs_exportcollection" \
            "discogs_getreldata" \
            "discogs_getuserdata" \
            "discogs_writecustom" ; do

  echo "install: /usr/local/bin/$file"
  cp "$file" "/usr/local/bin/$file"
  chmod 755 "/usr/local/bin/$file"
done

echo "Now you can delete the src-folder"

exit 0
