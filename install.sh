#!/bin/bash

if [ "$EUID" -ne "0" ] ; then 
  echo "Please run as root" >&2
  exit 1
fi

for file in "discogs_exportcollection" \
            "discogs_importcollection" \
            "discogs_getreldata" \
            "discogs_flactagger" ; do

  echo "install: /usr/local/bin/$file"
  cp "$file" "/usr/local/bin/$file"
  chmod 755 "/usr/local/bin/$file"
done

echo ""
echo "If you have a discogs token, you can create:"
echo "$HOME/.config/discogs-loader/discogs.conf"
echo "and insert your name, token in this form"
echo "USER discogsmember007"
echo "TOKEN AbCdEfGhIjKlMnOpQrStUvWxYz"

exit 0
