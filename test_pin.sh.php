#!/usr/bin/php
<?php
include("php-lib/defines.inc.php");

if(sunxi_gpio_init()==-1) die("Failed to open GPIO memory map. Are you running as root?\n");
//foreach($GPIO as $conn=>$map) {
//	foreach($map as $pin_name=>$pin_id) {
//		printf("%s: %s\t=\t%s\n",$conn,$pin_name,$GPIO_TYPE[sunxi_gpio_get_cfgpin($pin_id)]);
//	}
//}

$pin_id=$PIN['PG1'];

if(sunxi_gpio_set_cfgpin($pin_id,SUNXI_GPIO_OUTPUT)==-1) die("Failed to set pin $pin_id to output!\n");
sunxi_gpio_pullup($pin_id,0);
sunxi_gpio_pullup($pin_id,SUNXI_PULL_UP);
sunxi_gpio_pullup($pin_id,SUNXI_PULL_DOWN);
sunxi_gpio_output($pin_id,1);

print $GPIO_TYPE[sunxi_gpio_get_cfgpin($pin_id)];
?>
