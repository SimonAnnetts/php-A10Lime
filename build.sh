#!/bin/bash

echo "Using SWIG to create PHP module source..."
swig -php -prefix A10Lime A10Lime.i
echo "Compiling PHP module source..."
gcc `php-config --includes` -fpic -c A10Lime_wrap.c
gcc -shared A10Lime_wrap.o -o A10Lime.so


