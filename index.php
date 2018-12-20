<?php

use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\DI\FactoryDefault;
use Phalcon\Loader;
use Phalcon\Mvc\Application;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Session\Adapter\Files as Session;

error_reporting(E_ALL);
ini_set('display_errors', '1');

try {
    define('APPLICATION_PATH', __DIR__);

    // Register an autoloader
    $loader = new Loader();
    $loader->registerDirs([
        'app/controllers/',
        'app/models/'
    ]);
    $loader->registerNamespaces([
        'Services' => 'app/services/',
    ]);
    $loader->register();

    // Create a DI
    $di = new FactoryDefault();

    // Get the environment data
    $env = getenv('APPLICATION_ENV');
    $environment = isset($env) && !empty($env) ? $env : 'production';

    // Load the configuration based on the environment var
    if (file_exists('app/config/' . $environment . '.ini')) {
        $config = new \Phalcon\Config\Adapter\Ini('app/config/' . $environment . '.ini');
    }
    $di->set('config', $config);

    // setting up the database using the configuration
    $di->set('db', function () use ($config) {
        return new DbAdapter(array(
            "host" => $config->database->host,
            "username" => $config->database->username,
            "password" => $config->database->password,
            "dbname" => $config->database->dbname,
            "port" => $config->database->port
        ));
    });

    // Register Volt as a service
    $di->set('voltService', function ($view, $di) {
        $volt = new Volt($view, $di);
        $volt->setOptions(
            array(
                "compiledPath" => "app/views.cache/",
                "compiledExtension" => ".compiled",
                'compileAlways' => true
            )
        );
        return $volt;
    });

    // Register Volt as template engine
    $di->set('view', function () {
        $view = new View();
        $view->setViewsDir('app/views/');
        $view->registerEngines(
            array(
                ".volt" => 'voltService'
            )
        );
        return $view;
    });

    // Start the session the first time when some component request the session service
    $di->setShared('session', function () {
        $session = new Session();
        $session->start();
        return $session;
    });

    // Register the flash service with bootstrap CSS classes
    $di->set('flash', function() {
        $flash = new \Phalcon\Flash\Session([
            'error' => 'alert alert-danger',
            'success' => 'alert alert-success',
            'notice' => 'alert alert-info',
        ]);
        return $flash;
    });

    // Handle the request
    $application = new Application($di);
    echo $application->handle()->getContent();
} catch (\Exception $e) {
    echo "PhalconException: ", $e->getMessage();
}