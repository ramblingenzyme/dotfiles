#!/bin/bash

# Update USB IDs optmisied v0.3

# Param Defaults
QUIET=false
FORCE=false

# Get any params defined
for i in "$@"
do
case $i in
        -q)	QUIET=true ;;
        -f)	FORCE=true ;;
        -*)	echo "UNKNOWN PARAMETER ${i#*=}"; exit ;;
esac
done

# The URL to download
USBIDS_URL="http://www.linux-usb.org/usb.ids.gz"

# Where to store the ID list
USBIDS_PATH_LIST="/usr/share/hwdata/usb.ids"
USBIDS_PATH_REVISION="/usr/share/hwdata/usb.ids.version"

if [ ! -w "$USBIDS_PATH_LIST" ]; then
	if [ $QUIET = false ]; then echo "No write permission for $USBIDS_PATH_LIST"; fi
	exit
fi

# Regex
regexETag="ETag: \"([a-z0-9\-]+)\""
regexSize="Content-Length: ([0-9]+)"
regexLastMod="Last-Modified: ([a-zA-Z0-9\/ :,-]+)"
regexHTTPCode="HTTP/[0-9].[0-9] ([0-9]+) ([a-zA-Z0-9\. -]+)"

if [ $QUIET = false ]; then echo "Updating USB IDs..."; fi

#Get the HTTP headers for the IDs
USBIDS_HEADERS=`curl -sI "$USBIDS_URL"`

#Get the HTTP response code
[[ $USBIDS_HEADERS =~ $regexHTTPCode ]]
USBIDS_RESPONSE_CODE="${BASH_REMATCH[1]}"
USBIDS_RESPONSE_MSG="${BASH_REMATCH[2]}"

if [ "$USBIDS_RESPONSE_CODE" != 200 ]; then
	if [ $QUIET = false ]; then echo "Download Error [HTTP $USBIDS_RESPONSE_CODE $USBIDS_RESPONSE_MSG]"; fi
	exit
fi

#Get the date the list was last modified
[[ $USBIDS_HEADERS =~ $regexLastMod ]]
USBIDS_LASTMOD="${BASH_REMATCH[1]}"
USBIDS_LASTMOD=`date --date="$USBIDS_LASTMOD" +%s`

#Get the ID list size
[[ $USBIDS_HEADERS =~ $regexSize ]]
USBIDS_SIZE="${BASH_REMATCH[1]}"

#Get the ID list ETag
[[ $USBIDS_HEADERS =~ $regexETag ]]
USBIDS_ETAG="${BASH_REMATCH[1]}"

#Get the current revision if there is one
if [ -f "$USBIDS_PATH_REVISION" ]; then
	USBIDS_VERSION=`cat "$USBIDS_PATH_REVISION"`
fi

# Check if the version we requested is different from the current one
if [ "$USBIDS_VERSION" = "$USBIDS_ETAG" ] && [ $FORCE = false ]; then
	if [ $QUIET = false ]; then echo "List is already up to date"; fi
	exit
fi

# Backup the list
cp -a "$USBIDS_PATH_LIST" "$USBIDS_PATH_LIST"~

# Download the new list
if [ $QUIET = false ]; then
	curl -sL "$USBIDS_URL" | pv -s "$USBIDS_SIZE" -cN "Download" | zcat | pv -cN "Extract" > "$USBIDS_PATH_LIST"
else
	curl -sL "$USBIDS_URL" | zcat > "$USBIDS_PATH_LIST"
fi

# Write the new version to the version file
if [ $QUIET = false ]; then echo "$USBIDS_ETAG" > "$USBIDS_PATH_REVISION"; fi

if [ $QUIET = false ]; then echo "List updated!"; fi
