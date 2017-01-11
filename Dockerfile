
# britcoin compile docker image

FROM ubuntu
MAINTAINER plod <me@plod.tv>

RUN apt-get update && apt-get install -y \
        build-essential \
	libssl-dev \
	libdb++-dev \
	libqrencode-dev \
 	qt5-default \
	qt5-qmake \
	qtbase5-dev-tools \
	qttools5-dev-tools \
    	libboost-dev \
	libboost-system-dev \
    	libboost-filesystem-dev \
	libboost-program-options-dev \
	libboost-thread-dev \
	libevent-dev \
	libminiupnpc-dev \
	libleveldb-dev \
	git

RUN mkdir -p /usr/src/

WORKDIR /usr/src

RUN git clone https://github.com/britcoin3/britcoin3.3.git

WORKDIR /usr/src/britcoin3.3

RUN echo "#!/bin/bash\nTHE_PATH=/usr/src/britcoin3.3\ncd \$THE_PATH\n/usr/bin/qmake\ncd src/leveldb\n/usr/bin/make libleveldb.a libmemenv.a\ncd \$THE_PATH\n/usr/bin/make\n/bin/ls\n/bin/mv britcoin3.3* /export/britcoin-qt" > buildBrit.sh

RUN chmod +x buildBrit.sh

RUN mkdir /export

ENTRYPOINT /usr/src/britcoin3.3/buildBrit.sh
#ENTRYPOINT /bin/bash
