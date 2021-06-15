#!/bin/bash

#FILETYPE
#AUTHUSER
#AUTHPASS
#URL
while true; do
	
	if [[ -z "${AUTHUSER}" ]]; then
  	wget $URL -O send.$FILETYPE
	else
	wget --user=$AUTHUSER --password=$AUTHPASS $URL -O send.$FILETYPE
	fi

        md5sum ./send.$FILETYPE > hash.new


if cmp -s "./hash.old" "hash.new" ; then
    rm ./send.$FILETYPE
    sleep 5
else

                telegram-send --file ./send.$FILETYPE
                rm ./send.$FILETYPE
                mv hash.new  hash.old

fi

done

