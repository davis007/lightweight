<?php
function url(string $path = ''): string {
    $base = $_ENV['APP_URL'] ?? '';
    return rtrim($base, '/') . '/' . ltrim($path, '/');
}
