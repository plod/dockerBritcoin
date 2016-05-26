#!/bin/bash
docker build -t britcoin .
docker run -t -i -v export:/export --rm britcoin
./export/britcoin-qt &
