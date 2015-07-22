#!/bin/bash

DESTDIR=/usr
PREFIX=/local

gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -fPIC -c gpio/gpio_lib.c -o gpio/gpio_lib.o
gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -Wl,-z,relro gpio/gpio_lib.o -o libA10Lime-gpio.so


gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -fPIC -c i2c/i2c_lib.c -o i2c/i2c_lib.o
gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -Wl,-z,relro i2c/i2c_lib.o -o libA10Lime-i2c.so


gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -fPIC -c spi/spi_lib.c -o spi/spi_lib.o
gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -Wl,-z,relro spi/spi_lib.o -o libA10Lime-spi.so

sudo install -m 0755 -d			${DESTDIR}${PREFIX}/lib
sudo install -m 0755 libA10Lime-gpio.so		${DESTDIR}${PREFIX}/lib/libA10Lime-gpio.so
sudo install -m 0755 libA10Lime-i2c.so		${DESTDIR}${PREFIX}/lib/libA10Lime-i2c.so
sudo install -m 0755 libA10Lime-spi.so		${DESTDIR}${PREFIX}/lib/libA10Lime-spi.so
sudo ldconfig ${DESTDIR}${PREFIX}/lib/
