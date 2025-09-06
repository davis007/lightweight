@extends('layout')

@section('title')
ログイン - Lightweight Framework
@endsection

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-primary text-white text-center py-4">
                    <h3 class="mb-0">
                        <i class="fas fa-sign-in-alt mr-2"></i>
                        ログイン
                    </h3>
                </div>
                <div class="card-body p-5">
                    <div class="text-center mb-4">
                        <p class="text-muted">メールアドレスを入力すると、ログインリンクが送信されます</p>
                    </div>

                    <form method="POST" action="/login" id="loginForm">
                        <div class="form-group">
                            <label for="email" class="font-weight-bold">メールアドレス</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-envelope text-primary"></i>
                                    </span>
                                </div>
                                <input type="email"
                                       class="form-control form-control-lg"
                                       id="email"
                                       name="email"
                                       placeholder="your@email.com"
                                       required
                                       autocomplete="email">
                            </div>
                            <small class="form-text text-muted">
                                登録済みのメールアドレスを入力してください
                            </small>
                        </div>

                        <button type="submit"
                                class="btn btn-primary btn-lg btn-block mt-4 py-3"
                                id="submitBtn">
                            <i class="fas fa-paper-plane mr-2"></i>
                            ログインリンクを送信
                        </button>
                    </form>

                    <div class="alert alert-info mt-4" role="alert">
                        <h6 class="alert-heading">
                            <i class="fas fa-info-circle mr-2"></i>
                            マジックリンク認証について
                        </h6>
                        <p class="mb-0 small">
                            パスワードは必要ありません。メールで送信されるリンクをクリックするだけでログインできます。
                        </p>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <p class="text-muted small">
                    Lightweight Framework &copy; 2025
                </p>
            </div>
        </div>
    </div>
</div>

<style>
.card {
    border-radius: 15px;
}
.card-header {
    border-radius: 15px 15px 0 0 !important;
    border: none;
}
.btn {
    border-radius: 10px;
    font-weight: 600;
}
.form-control {
    border-radius: 8px;
    border: 2px solid #e9ecef;
    transition: all 0.3s ease;
}
.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
.input-group-text {
    border-radius: 8px 0 0 8px;
    border: 2px solid #e9ecef;
    border-right: none;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('loginForm');
    const submitBtn = document.getElementById('submitBtn');

    form.addEventListener('submit', function(e) {
        e.preventDefault();

        // ボタンの状態を変更
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>送信中...';

        // ここで実際の送信処理を行う
        setTimeout(() => {
            // 送信成功時の処理
            submitBtn.innerHTML = '<i class="fas fa-check mr-2"></i>送信完了';
            submitBtn.classList.remove('btn-primary');
            submitBtn.classList.add('btn-success');

            // 3秒後に元に戻す
            setTimeout(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fas fa-paper-plane mr-2"></i>ログインリンクを送信';
                submitBtn.classList.remove('btn-success');
                submitBtn.classList.add('btn-primary');
            }, 3000);
        }, 1500);
    });
});
</script>
@endsection
