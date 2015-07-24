#!/usr/bin/php
<?php
print "This module provides the following functions:\n";

$f=get_extension_funcs ('A10Lime');
print_r($f);

print "This module provides the following constants:\n";
$c=get_defined_constants (true);
print_r($c['A10Lime']);

?>
