<?php
namespace Core;

class Request {
    private static ?Request $instance = null;
    private string $ip;
    private string $userAgent;
    private string $method;
    private string $uri;
    private string $referer;

    private function __construct() {
        $this->ip = $_SERVER['HTTP_X_FORWARDED_FOR']
            ?? $_SERVER['REMOTE_ADDR']
            ?? 'unknown';
        $this->userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'unknown';
        $this->method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
        $this->uri = $_SERVER['REQUEST_URI'] ?? '/';
        $this->referer = $_SERVER['HTTP_REFERER'] ?? '';
    }

    public static function getInstance(): Request {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getIp(): string {
        return $this->ip;
    }

    public function getUserAgent(): string {
        return $this->userAgent;
    }

    public function getMethod(): string {
        return $this->method;
    }

    public function getUri(): string {
        return $this->uri;
    }

    public function getReferer(): string {
        return $this->referer;
    }
}