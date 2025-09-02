<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
    <header class="bg-primary text-white p-3">
        <div class="container">
            <h1>サイトヘッダー</h1>
        </div>
    </header>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 bg-light sidebar py-5">
                <ul class="nav flex-column">
                    <li class="nav-item"><a href="#" class="nav-link">リンク1</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">リンク2</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">リンク3</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">リンク4</a></li>
                </ul>
            </nav>
            <main class="col-md-9 py-5">
                @yield('content')
            </main>
        </div>
    </div>
    <footer class="bg-secondary text-white text-center py-3 mt-auto">
        <div class="container">
            フッターコンテンツ
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
