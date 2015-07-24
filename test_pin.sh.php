#!/usr/bin/php
<?php
include("php-lib/defines.inc.php");

if(sunxi_gpio_init()==-1) die("Failed to open GPIO memory map. Are you running as root?\n");

$PG0=$PIN['PG0'];
$PG1=$PIN['PG1'];

if(sunxi_gpio_set_cfgpin($PG0,SUNXI_GPIO_OUTPUT)==-1) die("Failed to set pin $PG0 to output!\n");
sunxi_gpio_pullup($PG0,0);
sunxi_gpio_pullup($PG0,SUNXI_PULL_UP);
sunxi_gpio_pullup($PG0,SUNXI_PULL_DOWN);
if(sunxi_gpio_set_cfgpin($PG1,SUNXI_GPIO_OUTPUT)==-1) die("Failed to set pin $PG1 to output!\n");
sunxi_gpio_pullup($PG1,0);
sunxi_gpio_pullup($PG1,SUNXI_PULL_UP);
sunxi_gpio_pullup($PG1,SUNXI_PULL_DOWN);

$v=0;

while (1) {
	sunxi_gpio_output($PG0,$v);
	sunxi_gpio_output($PG1,!$v);
	$v=!$v;
	usleep(25000);
}

?>
