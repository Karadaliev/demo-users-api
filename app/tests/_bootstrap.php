<?php

use Phalcon\Loader;

ini_set('display_errors', 1);
error_reporting(E_ALL);

define('ROOT_PATH', '../app/tests/');
$loader = new Loader();
$loader->registerDirs([
    '../app/controllers/',
    '../app/models/',
    '../app/tests/'
]);

$loader->registerNamespaces([
    'Services' => '../app/services/'
]);

$loader->register();