#!/bin/bash


mkdir /tmp/install
cd /tmp/install
wget http://uk1.php.net/distributions/php-5.4.15.tar.bz2
apt-get update
apt-get upgrade -yq
apt-get -yq install bzip2 openssl libxml2 libxml2-dev gcc make autoconf htop sudo git dstat iotop iftop 
apt-get -yq build-dep php5 openssl
tar xvjf php-5*.tar.bz2
cd php-5*
cd ext/
git clone git://github.com/krakjoe/pthreads.git
cd ../
./buildconf --force
./configure --enable-maintainer-zts --enable-sockets --enable-pcntl --enable-pthreads --with-tsrm-pthreads --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pgsql=/usr --with-tidy=/usr  --with-pdo-pgsql=/usr --with-pdo-mysql=mysqlnd --with-xsl=/usr --enable-zip --with-pear  --with-gd --with-jpeg-dir=/usr --with-png-dir=/usr --with-mcrypt=/usr  --with-config-file-path=/usr/local/lib/

make clean
make
#make test
make install
cd ext/openssl
mv config0.m4 config.m4
phpize
./configure
make
make install