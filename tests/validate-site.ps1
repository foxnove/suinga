$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$requiredFiles = @(
    'index.html',
    'assets/css/styles.css',
    'assets/images/logo-suinga.webp',
    'assets/images/slide-01.webp',
    'assets/images/slide-02.webp',
    'assets/images/slide-03.webp',
    'assets/images/slide-04.webp',
    'assets/images/slide-05.webp',
    'assets/images/slide-06.webp',
    'assets/images/slide-07.webp',
    'assets/images/slide-08.webp'
)

$missingFiles = @($requiredFiles | Where-Object { -not (Test-Path (Join-Path $projectRoot $_)) })
if ($missingFiles.Count -gt 0) {
    throw "Arquivos obrigatórios ausentes: $($missingFiles -join ', ')"
}

$page = Get-Content -Raw (Join-Path $projectRoot 'index.html')
$requiredTokens = @(
    'lang="pt-BR"',
    'YouTube',
    'Spotify',
    'Deezer',
    'Apple Music',
    'Amazon Music',
    'YouTube Music',
    'logo-suinga.webp',
    'slide-08.webp',
    'https://www.youtube.com/@suinga',
    'https://open.spotify.com/artist/3gGILrQvJ5CUctb3bfwXqi',
    'https://www.deezer.com/artist/5360265',
    'https://music.apple.com/br/artist/suinga/757715951',
    'https://music.amazon.com/artists/B00GSQ6NOW/suinga',
    'https://music.youtube.com/@suinga'
)

$missingTokens = @($requiredTokens | Where-Object { $page -notlike "*$_*" })
if ($missingTokens.Count -gt 0) {
    throw "Elementos obrigatórios ausentes na página: $($missingTokens -join ', ')"
}

Write-Host 'PASS: estrutura, identidade e destinos de streaming validados.'
