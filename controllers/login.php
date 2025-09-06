<?php
// ログインページコントローラー
require_once __DIR__ . '/../core/view.php';

// ビューをレンダリング
echo view('login', [
    'title' => 'ログイン - Lightweight Framework'
]);
