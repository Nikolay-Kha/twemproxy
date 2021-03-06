#!/bin/bash
#file   : travis.sh
#author : ning
#date   : 2014-05-10 16:54:43

#build twemproxy
CFLAGS="-ggdb3 -O0" autoreconf -fvi && ./configure --enable-debug=log && make 

ln -s `pwd`/src/nutcracker  tests/_binaries/
cp `which redis-server` tests/_binaries/
cp `which redis-cli` tests/_binaries/
cp `which memcached` tests/_binaries/
echo ------------------------------------------
ls tests/_binaries/
python -V
echo ------------------------------------------

#run test
(cd tests/ && nosetests -x -vvv)

