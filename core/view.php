<?php

class BladeEngine {
    private $viewPath;
    private $sections = [];
    private $stacks = [];
    private $extends = null;

    public function __construct($viewPath = null) {
        $this->viewPath = $viewPath ?: __DIR__ . '/../views/';
    }

    /**
     * テンプレートをレンダリング
     */
    public function render($template, $data = []) {
        $this->sections = [];
        $this->stacks = [];
        $this->extends = null;

        $templatePath = $this->viewPath . $template . '.tpl';

        if (!file_exists($templatePath)) {
            throw new Exception("テンプレートファイルが見つかりません: {$templatePath}");
        }

        $content = file_get_contents($templatePath);

        // Bladeディレクティブの処理
        $content = $this->compileBladeDirectives($content);

        // データを展開してテンプレートを実行
        extract($data);
        ob_start();
        eval('?>' . $content);
        $output = ob_get_clean();

        // @extendsが指定されている場合は親テンプレートを処理
        if ($this->extends) {
            return $this->renderExtended($this->extends, $data);
        }

        return $output;
    }

    /**
     * 継承されたテンプレートをレンダリング
     */
    private function renderExtended($parentTemplate, $data) {
        $parentPath = $this->viewPath . $parentTemplate . '.tpl';

        if (!file_exists($parentPath)) {
            throw new Exception("親テンプレートファイルが見つかりません: {$parentPath}");
        }

        $parentContent = file_get_contents($parentPath);
        $parentContent = $this->compileBladeDirectives($parentContent);

        // データを展開して親テンプレートを実行
        extract($data);
        ob_start();
        eval('?>' . $parentContent);
        return ob_get_clean();
    }

    /**
     * Bladeディレクティブをコンパイル
     */
    private function compileBladeDirectives($content) {
        // @extends の処理
        $content = preg_replace_callback(
            '/@extends\([\'"]([^\'"]+)[\'"]\)/',
            function($matches) {
                $this->extends = $matches[1];
                return '';
            },
            $content
        );

        // @section の処理（インライン）
        $content = preg_replace_callback(
            '/@section\([\'"]([^\'"]+)[\'"],\s*[\'"]([^\'"]*)[\'"\)]/s',
            function($matches) {
                $this->sections[$matches[1]] = $matches[2];
                return '';
            },
            $content
        );

        // @section ... @endsection の処理
        $content = preg_replace_callback(
            '/@section\([\'"]([^\'"]+)[\'"]\)(.*?)@endsection/s',
            function($matches) {
                $this->sections[$matches[1]] = trim($matches[2]);
                return '';
            },
            $content
        );

        // @yield の処理
        $content = preg_replace_callback(
            '/@yield\([\'"]([^\'"]+)[\'"]\)/',
            function($matches) {
                $sectionName = $matches[1];
                return isset($this->sections[$sectionName]) ? $this->sections[$sectionName] : '';
            },
            $content
        );

        // @if の処理（コメント内の@ifを無視するため、HTMLタグ内ではないことを確認）
        $content = preg_replace('/@if\s*\((.*?)\)(?!.*>)/', '<?php if($1): ?>', $content);
        $content = preg_replace('/@elseif\s*\((.*?)\)(?!.*>)/', '<?php elseif($1): ?>', $content);
        $content = preg_replace('/@else(?!.*>)/', '<?php else: ?>', $content);
        $content = preg_replace('/@endif(?!.*>)/', '<?php endif; ?>', $content);

        // @foreach の処理
        $content = preg_replace('/@foreach\s*\((.*?)\)/', '<?php foreach($1): ?>', $content);
        $content = preg_replace('/@endforeach/', '<?php endforeach; ?>', $content);

        // @for の処理
        $content = preg_replace('/@for\s*\((.*?)\)/', '<?php for($1): ?>', $content);
        $content = preg_replace('/@endfor/', '<?php endfor; ?>', $content);

        // @while の処理
        $content = preg_replace('/@while\s*\((.*?)\)/', '<?php while($1): ?>', $content);
        $content = preg_replace('/@endwhile/', '<?php endwhile; ?>', $content);

        // @php の処理（インラインPHPコード）
        $content = preg_replace('/@php\s*(.*?)\s*@endphp/s', '<?php $1 ?>', $content);

        // @unless の処理
        $content = preg_replace('/@unless\s*\((.*?)\)/', '<?php if(!($1)): ?>', $content);
        $content = preg_replace('/@endunless/', '<?php endif; ?>', $content);

        // @isset の処理
        $content = preg_replace('/@isset\s*\((.*?)\)/', '<?php if(isset($1)): ?>', $content);
        $content = preg_replace('/@endisset/', '<?php endif; ?>', $content);

        // @empty の処理
        $content = preg_replace('/@empty\s*\((.*?)\)/', '<?php if(empty($1)): ?>', $content);
        $content = preg_replace('/@endempty/', '<?php endif; ?>', $content);

        // {{ }} の処理（エスケープ付き出力）
        $content = preg_replace('/\{\{\s*(.*?)\s*\}\}/', '<?= htmlspecialchars($1, ENT_QUOTES, "UTF-8") ?>', $content);

        // {!! !!} の処理（エスケープなし出力）
        $content = preg_replace('/\{!!\s*(.*?)\s*!!\}/', '<?= $1 ?>', $content);

        return $content;
    }
}

// 後方互換性のためのラッパー関数
function view($template, $data = []) {
    static $bladeEngine = null;

    if ($bladeEngine === null) {
        $bladeEngine = new BladeEngine();
    }

    return $bladeEngine->render($template, $data);
}
