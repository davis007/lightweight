<?php
function view($template, $data = []) {
    $path = __DIR__ . '/../views/' . $template . '.tpl';
    $content = file_get_contents($path);

    extract($data);
    ob_start();
    eval('?>' . $content);
    return ob_get_clean();
}