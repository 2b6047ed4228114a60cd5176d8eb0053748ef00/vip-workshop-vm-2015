#!/bin/bash

set -e

wp core is-installed

while [ $# -gt 0 ]
do
	POST_SLUG=$1

	POST_ID=$( wp post list --name="$POST_SLUG" --field=ID );
	if [ -z "$POST_ID" ]
	then
		exit 1
	fi

	COMMENT_ID=$( wp comment list --meta_key=_next_post --post_id="$POST_ID" --field=comment_ID )
	if [ -z "$COMMENT_ID" ]
	then
		if [ $# -gt 1 ]
		then
			exit 1
		else
			exit 0
		fi
	fi

	if [ $# -gt 1 ]
	then
		set +e
		wp comment meta update "$COMMENT_ID" _next_post "$2" 2> /dev/null
		set -e

		echo "POST: $POST_SLUG=$POST_ID -> COMMENT: $COMMENT_ID -> $2"
	fi

	shift
done
