#!/bin/bash

echo "Using SWIG to create PHP module source..."
swig -php -prefix A10Lime A10Lime.i
echo "Compiling PHP module source..."
gcc `php-config --includes` -fpic -c A10Lime_wrap.c
gcc -shared A10Lime_wrap.o -lA10Lime-gpio -lA10Lime-i2c -lA10Lime-spi -o A10Lime.so

echo "Copying A10Lime.so to PHP extensions dir..."
echo "extension=`php-config --extension-dir`/A10Lime.so" >A10Lime.ini

sudo cp -f A10Lime.so `php-config --extension-dir`/
sudo cp -f A10Lime.ini /etc/php5/conf.d/90-A10Lime.ini
sudo chown root:root `php-config --extension-dir`/A10Lime.so /etc/php5/conf.d/90-A10Lime.ini

echo "There is a A10Lime.php include file that loads the module and provides a A10Lime class."
echo "DONE!"