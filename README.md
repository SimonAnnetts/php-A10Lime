php-A10Lime
===========

PHP bindings to the Olimex A10 GPIO libraries.
This is a module for PHP which allows access to GPIO, I2C and SPI on an Olimex A10Lime. It should also work on the A20Lime.


WARNING: This is an in-development library, it will not be bug free and fully featured.
    Please email simon at ateb dot co dot uk if you have any problems, suggestions,
    questions or words of support.
    
Testing:
    Built with gcc version 4.6.3 (Debian 4.6.3-14) on A10Lime
    Built against PHP 5.4.41-0+deb7u1 on A10Lime
    

Prerequisites:
    You must have git, git-core, swig2.0, php5-dev, php5-cli and php5-common installed
    as well as the usual build tools gcc etc.
    
    
Get/setup repo:

		git clone https://github.com/JakDaniels/php-A10Lime
		cd php-A10Lime

Build & install with:
    
		./build-lib.sh
		./build.sh
		
Check that the module loads:

		php -m
		
Look for the A10Lime module in the list and that there are no errors.
    
The build script does the following things:
    
	1) Builds and Installs the native A10Lime libraries
	3) Creates an interface file for SWIG using the A10Lime header files
	4) Uses SWIG to create the PHP module source code and include files
	5) Builds the PHP module source and then installs the shared module library (using sudo)

