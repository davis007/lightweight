<?php
// ホームページコントローラー
require_once __DIR__ . '/../core/view.php';

// ビューをレンダリング
echo view('home', [
    'title' => 'Lightweight Framework - ホーム',
    'framework_name' => 'Lightweight Framework'
]);
