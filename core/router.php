<?php
class Router {
    protected $routes;
    public function __construct($routes) {
        $this->routes = $routes;
    }
    public function dispatch($uri) {
        $path = parse_url($uri, PHP_URL_PATH);
        if (isset($this->routes[$path])) {
            include $this->routes[$path];
        } else {
            http_response_code(404);
            echo "404 Not Found";
        }
    }
}