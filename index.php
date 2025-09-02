<?php
require_once __DIR__ . '/core/session.php';
require_once __DIR__ . '/core/router.php';
require_once __DIR__ . '/core/Request.php';

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

use Core\Session;
use Core\Request;


Session::start();
// Requestはシングルトンなのでここでインスタンス化は不要

$router = new Router(require 'routes.php');
$router->dispatch($_SERVER['REQUEST_URI']);