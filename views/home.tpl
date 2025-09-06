@extends('layout')

@section('title')
Lightweight Framework - ホーム
@endsection

@section('content')
<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <div class="jumbotron bg-light p-5 rounded">
                <h1 class="display-4">Lightweight Framework</h1>
                <p class="lead">シンプルで軽量なPHPフレームワーク</p>
                <hr class="my-4">
                <p>最小限の機能で高速なWebアプリケーション開発を実現します。</p>
            </div>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-12">
            <h2>基本的な使い方</h2>

            <div class="card mb-4">
                <div class="card-header">
                    <h4>1. ルーティングの設定</h4>
                </div>
                <div class="card-body">
                    <p>ルーティングは <code>routes.php</code> ファイルで設定します。</p>
                    <pre><code class="language-php">return [
    '/'       => 'controllers/home.php',
    '/login'  => 'controllers/login.php',
    '/about'  => 'controllers/about.php',
];</code></pre>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h4>2. コントローラーの作成</h4>
                </div>
                <div class="card-body">
                    <p>コントローラーは <code>controllers/</code> ディレクトリにPHPファイルとして作成します。</p>
                    <pre><code class="language-php">&lt;?php
require_once __DIR__ . '/../core/view.php';

echo view('home', [
    'title' => 'ページタイトル',
    'data'  => $some_data
]);</code></pre>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h4>3. ビューの作成</h4>
                </div>
                <div class="card-body">
                    <p>ビューは <code>views/</code> ディレクトリに <code>.tpl</code> 拡張子で作成します。</p>
                    <p>Bladeライクなテンプレート構文を使用できます：</p>
                    <ul>
                        <li><code>@extends('layout')</code> - レイアウトの継承</li>
                        <li><code>@section('content')...@endsection</code> - コンテンツセクション</li>
                        <li><code>@if</code>, <code>@foreach</code> - 制御構造</li>
                        <li><code>{{ $variable }}</code> - 変数の出力（エスケープ付き）</li>
                        <li><code>{!! $html !!}</code> - HTMLの出力（エスケープなし）</li>
                    </ul>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h4>4. データベース接続</h4>
                </div>
                <div class="card-body">
                    <p><code>.env</code> ファイルにデータベース設定を記述します。</p>
                    <pre><code>DB_HOST=localhost
DB_NAME=your_database
DB_USER=your_username
DB_PASS=your_password</code></pre>
                    <p>環境変数は <code>getenv('DB_HOST')</code> で取得できます。</p>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h4>5. セッション管理</h4>
                </div>
                <div class="card-body">
                    <p>セッションは自動的に開始され、<code>$_SESSION</code> グローバル変数でアクセスできます。</p>
                    <pre><code class="language-php">// セッションへの値の設定
$_SESSION['user_id'] = 123;

// セッションからの値の取得
$userId = $_SESSION['user_id'];</code></pre>
                </div>
            </div>

            <div class="alert alert-info">
                <h5>特徴</h5>
                <ul>
                    <li>軽量で高速な動作</li>
                    <li>シンプルなMVCアーキテクチャ</li>
                    <li>Bladeライクなテンプレートエンジン</li>
                    <li>環境変数による設定管理</li>
                    <li>Bootstrap 4.5対応</li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection
