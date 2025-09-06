@extends('layout')

@section('title')
テストページ
@endsection

@section('content')
<div class="container mt-5">
    <h2>条件分岐テスト</h2>

    <!-- @if ディレクティブテスト -->
    @if(true)
        <div class="alert alert-success">@ifディレクティブが動作しています！</div>
    @endif

    @if(false)
        <div class="alert alert-danger">これは表示されないはずです</div>
    @else
        <div class="alert alert-info">@elseディレクティブが動作しています！</div>
    @endif

    <h2 class="mt-4">ループテスト</h2>

    <!-- @foreach ディレクティブテスト -->
    @foreach(['りんご', 'ばなな', 'みかん'] as $index => $fruit)
        <div class="card mb-2">
            <div class="card-body">
                {{ $index + 1 }}. {{ $fruit }}
            </div>
        </div>
    @endforeach

    <!-- 変数テスト -->
    <h2 class="mt-4">変数テスト</h2>
    @if($show_message)
        <div class="alert alert-warning">変数からメッセージを表示: {{ $message }}</div>
    @endif
</div>
@endsection
