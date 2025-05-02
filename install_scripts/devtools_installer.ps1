choco install -y git vscode docker-desktop nodejs dotnet-sdk dbeaver visualstudio2022community

# クローン先のディレクトリ（必要に応じて変更）
$cloneDir = "$HOME\Tools\ULE4JIS"

# GitHub リポジトリ URL
$repoUrl = "https://github.com/dezz/ULE4JIS.git"

# ディレクトリが存在しない場合にクローン
if (!(Test-Path $cloneDir)) {
    git clone $repoUrl $cloneDir
} else {
    Write-Host "📁 既に存在しています: $cloneDir"
}

# フォントディレクトリ作成
$fontDir = "$HOME\Downloads\fonts"
New-Item -ItemType Directory -Path $fontDir -Force | Out-Null

# 源ノ角ゴシック（Source Han Sans）をダウンロード
$fontZipUrl = "https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.zip"
$fontZip = "$fontDir\2.012R.zip"
Invoke-WebRequest -Uri $fontZipUrl -OutFile $fontZip

# 解凍してフォントをインストール
Expand-Archive -Path $fontZip -DestinationPath $fontDir -Force

# フォントファイルをインストール（.otf or .ttf）
Get-ChildItem -Path $fontDir -Recurse -Include *.otf, *.ttf | ForEach-Object {
    $fontPath = $_.FullName
    Write-Host "🔤 インストール中: $($_.Name)"
    Copy-Item $fontPath -Destination "$env:WINDIR\Fonts"
    Start-Process -FilePath "reg" -ArgumentList "add HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts /v $($_.BaseName) /t REG_SZ /d $($_.Name) /f" -Verb runAs -Wait
}