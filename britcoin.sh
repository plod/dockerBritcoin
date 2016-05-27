#!/bin/bash
BRIT_EXPORT_PATH="$PWD/export"
BRITWALLET="$BRIT_EXPORT_PATH/britcoin-qt"

if [ ! -f $BRITWALLET ];
then
	docker build -t britcoin .
	docker run -t -i -v $BRIT_EXPORT_PATH:/export --rm britcoin
fi

$BRITWALLET &
