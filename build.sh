#!/bin/bash

mkdir lib/ 2>/dev/null
mkdir etc/ 2>/dev/null

echo "Using SWIG to create PHP module source..."
cd src/
swig -php -prefix A10Lime_ A10Lime.i
mv -f A10Lime.php ../php-lib/

echo "Compiling PHP module source..."
gcc `php-config --includes` -fpic -c A10Lime_wrap.c
gcc -shared A10Lime_wrap.o -lA10Lime-gpio -lA10Lime-i2c -lA10Lime-spi -o ../lib/A10Lime.so

echo "Copying A10Lime.so to PHP extensions dir..."
echo "extension=`php-config --extension-dir`/A10Lime.so" >../etc/A10Lime.ini

sudo cp -f ../lib/A10Lime.so `php-config --extension-dir`/A10Lime.so
sudo cp -f ../etc/A10Lime.ini /etc/php5/conf.d/90-A10Lime.ini
sudo chown root:root `php-config --extension-dir`/A10Lime.so /etc/php5/conf.d/90-A10Lime.ini

echo "There is a A10Lime.php include file that loads the module and provides a A10Lime class."
echo "DONE!"