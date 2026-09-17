# Suinga Landing Page Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Entregar uma landing page estática, elegante e responsiva da Suinga, pronta para GitHub Pages.

**Architecture:** O `index.html` concentra a estrutura semântica, conteúdo e URLs de streaming; `assets/css/styles.css` contém toda a identidade visual e responsividade. Bootstrap e Bootstrap Icons são consumidos por CDN, enquanto os assets locais otimizados ficam em `assets/images/`.

**Tech Stack:** HTML5, CSS3, Bootstrap 5.3, Bootstrap Icons, WebP, PowerShell para validação estática.

**Spec:** `docs/superpowers/specs/2026-09-17-suinga-landing-page-design.md`

## Global Constraints

- Preservar todos os JPEGs originais em `img/` sem alteração.
- Usar somente arquivos estáticos compatíveis com GitHub Pages; nenhum backend ou etapa de build será exigida ao visitante.
- Exibir a logo oficial sobre o carrossel sem fundo branco visível.
- Incluir exatamente YouTube, Spotify, Deezer, Apple Music, Amazon Music e YouTube Music como destinos editáveis.
- Usar versões WebP otimizadas em `assets/images/` e carregamento tardio para slides fora da imagem inicial.

---

### Task 1: Criar teste de contrato estático e estrutura de assets

**Files:**
- Create: `tests/validate-site.ps1`
- Create: `assets/images/.gitkeep`

**Interfaces:**
- Consumes: arquivos de raiz e a estrutura de assets do projeto.
- Produces: comando `powershell -ExecutionPolicy Bypass -File tests/validate-site.ps1` que encerra com código 0 somente quando a página atender ao contrato.

- [x] **Step 1: Escrever o teste que falha**

Criar `tests/validate-site.ps1` para exigir a existência de `index.html`, `assets/css/styles.css`, `assets/images/logo-suinga.webp` e sete arquivos `slide-*.webp`; exigir uma referência a cada plataforma e `lang="pt-BR"` em `index.html`.

- [x] **Step 2: Executar o teste para verificar a falha**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-site.ps1`

Expected: falha informando que `index.html` ainda não existe.

- [x] **Step 3: Criar diretórios de suporte**

Criar `assets/images/`, `assets/css/`, `assets/js/` e `tests/`, mantendo apenas o marcador necessário antes da implementação.

- [x] **Step 4: Confirmar que a falha permanece específica**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-site.ps1`

Expected: falha por artefatos de site ausentes, não por erro de sintaxe do teste.

### Task 2: Otimizar logo e fotos para entrega web

**Files:**
- Create: `assets/images/logo-suinga.webp`
- Create: `assets/images/slide-01.webp`
- Create: `assets/images/slide-02.webp`
- Create: `assets/images/slide-03.webp`
- Create: `assets/images/slide-04.webp`
- Create: `assets/images/slide-05.webp`
- Create: `assets/images/slide-06.webp`
- Create: `assets/images/slide-07.webp`

**Interfaces:**
- Consumes: `img/suinga-logo-transparente.png` e os sete JPEGs de `img/`.
- Produces: hero images WebP com lado maior de até 1920 px e logo WebP com branco convertido em transparência.

- [x] **Step 1: Produzir cópias WebP**

Converter cada foto para WebP em qualidade alta, respeitando a proporção e limitando o lado maior a 1920 px. Converter a logo removendo pixels próximos de branco e preservando seus contornos.

- [x] **Step 2: Inspecionar dimensões e tamanho**

Run: `Get-ChildItem assets/images/*.webp | Select-Object Name,Length`

Expected: oito WebPs presentes, consideravelmente menores que os JPEGs de origem.

### Task 3: Implementar a página e a identidade visual

**Files:**
- Create: `index.html`
- Create: `assets/css/styles.css`
- Create: `assets/js/main.js`

**Interfaces:**
- Consumes: `assets/images/logo-suinga.webp` e `assets/images/slide-01.webp` até `slide-07.webp`.
- Produces: página navegável diretamente por `index.html`, com carrossel e links sociais editáveis no atributo `href`.

- [x] **Step 1: Criar a marcação semântica**

Criar um documento `pt-BR` com Bootstrap 5.3 e Bootstrap Icons por CDN, um carrossel de sete imagens, um `main` com logo e destinos de streaming, e rodapé. Definir `href="#"` para as URLs provisórias com comentários claros de substituição.

- [x] **Step 2: Criar o estilo responsivo**

Adicionar hero de 100svh, gradiente escuro sobre as imagens, logo com largura fluida, controles de carrossel discretos, botões circulares e estados de foco amarelo–laranja. Reduzir animações com `prefers-reduced-motion`.

- [x] **Step 3: Implementar comportamento mínimo**

Inicializar o carrossel com intervalo de 6 segundos, pausa ao interagir e respeito a movimento reduzido; inserir o ano atual no rodapé.

- [x] **Step 4: Executar o teste de contrato**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-site.ps1`

Expected: PASS, com os arquivos e plataformas exigidos localizados.

### Task 4: Validar entrega estática

**Files:**
- Modify: `index.html` somente se uma validação identificar erro de contrato.

**Interfaces:**
- Consumes: página, CSS, JavaScript e assets gerados.
- Produces: entrega navegável sem caminhos locais ou referências aos JPEGs originais.

- [x] **Step 1: Verificar referências locais e tamanhos**

Run: `rg -n 'C:|img/.*jpg|file:' index.html assets; Get-ChildItem assets/images/*.webp | Measure-Object Length -Sum`

Expected: nenhum caminho de disco ou JPEG original é usado; os WebPs têm tamanho total mensurável.

- [x] **Step 2: Validar a sintaxe e o contrato final**

Run: `powershell -ExecutionPolicy Bypass -File tests/validate-site.ps1; node --check assets/js/main.js`

Expected: ambos os comandos retornam código 0.
