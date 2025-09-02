# lightweight フレームワーク

## 概要
lightweightは、超軽量なPHPフレームワークです。Laravel風の使いやすい機能を備え、シンプルな構成で高速に開発を始められます。

## 主な機能
- テンプレートエンジン
- ルーティング
- ページャー
- ZendDBサポート
- マジックリンク認証

## インストール手順
1. 必要な依存パッケージをインストールします。
   ```
   composer install
   ```

## 環境設定
プロジェクトルートに`.env`ファイルを作成し、必要な環境変数を設定してください。

## ローカルサーバーの起動
下記コマンドでローカル開発サーバーを起動できます。
```
php -S localhost:8000
```

ブラウザで http://localhost:8000 にアクセスして動作を確認してください。

## メール送信
メール送信にはSymfony Mailerを利用しています。`.env`ファイルに以下の環境変数を設定してください。

```
MAILER_DSN=smtp://username:password@smtp.example.com:587
MAIL_FROM_ADDRESS=your-email@example.com
```

メール送信のサンプルコードは以下の通りです。

```php
use Core\Mailer;

$mailer = new Mailer();
$mailer->sendMail('recipient@example.com', '件名', 'メール本文の内容');
```

HTMLメール
```php
use Core\Mailer;

$mailer = new Mailer();
$body = "<h1>こんにちは！</h1><p>これは<strong>HTMLメール</strong>です。</p>";

$mailer->sendMail('recipient@example.com', 'HTMLメールのテスト', $body);

```

Symfony Mailer では .text() と .html() を両方指定すれば、自動的にマルチパートメールになります。

```php
use Symfony\Component\Mime\Email;

$email = (new Email())
    ->from('no-reply@example.com')
    ->to('recipient@example.com')
    ->subject('マルチパートメールの例')
    ->text("これはテキスト版の本文です")
    ->html("<h1>これはHTML版の本文です</h1>");

$mailer->send($email);
```

## 添付ファイル
Symfony Mailerでは `attach()` と `attachFromPath()` が利用可能です。通常はファイルパスを指定して添付できる `attachFromPath()` を使います。

単一添付の例:
```php
use Symfony\Component\Mime\Email;

$email = (new Email())
    ->from('no-reply@example.com')
    ->to('recipient@example.com')
    ->subject('添付ファイルのテスト')
    ->text('添付ファイルを送信します。')
    ->attachFromPath('/path/to/file.pdf');

$mailer->send($email);
```

複数添付の例:
```php
use Symfony\Component\Mime\Email;

$email = (new Email())
    ->from('no-reply@example.com')
    ->to('recipient@example.com')
    ->subject('複数添付ファイルのテスト')
    ->text('複数の添付ファイルを送信します。')
    ->attachFromPath('/path/to/file1.pdf')
    ->attachFromPath('/path/to/file2.jpg');

$mailer->send($email);
```
