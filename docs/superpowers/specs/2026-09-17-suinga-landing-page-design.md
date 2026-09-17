# Suinga Landing Page — Design

## Objetivo

Criar uma página única, elegante e responsiva para a Suinga, pronta para hospedagem estática no GitHub Pages. A página deve apresentar a marca e direcionar o público às plataformas de música.

## Direção visual

- Estética editorial noturna: fotografias ocupam a primeira tela, com sobreposição em grafite/preto para preservar a leitura.
- A logo oficial da Suinga é a peça central. Sua paleta amarelo–laranja orienta os detalhes e estados interativos.
- O conteúdo será intencionalmente enxuto: marca, chamada curta e destinos de escuta.
- O fundo alterna as fotografias disponíveis em um carrossel Bootstrap com transições suaves e pausas acessíveis.

## Estrutura da página

1. **Hero/carrossel:** imagem em tela cheia, gradiente escuro e controles discretos de navegação.
2. **Camada de marca:** logo central, frase “Ouça Suinga onde quiser” e linha de apoio.
3. **Plataformas:** seis links circulares e acessíveis para YouTube, Spotify, Deezer, Apple Music, Amazon Music e YouTube Music. Cada URL fica concentrada no HTML como marcador fácil de trocar antes da publicação.
4. **Rodapé:** assinatura simples com o ano corrente e o nome da banda.

## Assets e desempenho

- Manter os JPEGs originais intactos em `img/`.
- Criar cópias WebP reduzidas para aproximadamente 1920 px no lado maior, adequadas a hero em desktop e com qualidade alta.
- Gerar uma versão WebP da logo com fundo branco removido para a sobreposição funcionar sobre qualquer foto.
- Carregar somente a imagem inicial do carrossel com prioridade; as demais usam carregamento tardio.

## Tecnologia e compatibilidade

- Um `index.html` estático, sem processo de build obrigatório.
- Bootstrap 5 e Bootstrap Icons carregados por CDN com atributos de integridade quando disponíveis.
- CSS local em `assets/css/styles.css` e JavaScript local em `assets/js/main.js`.
- Sem dependência de servidor, formulários, armazenamento ou autenticação; compatível com GitHub Pages.

## Acessibilidade

- Controles do carrossel com rótulos em português.
- Links de plataformas com nome acessível, abertura segura em nova guia e indicação visual de foco.
- Contraste garantido pela camada escura sobre as fotos e suporte a `prefers-reduced-motion`.

## Critérios de aceitação

- A página abre diretamente por `index.html` e se adapta a celular, tablet e desktop.
- A logo oficial aparece centralizada sem fundo branco visível.
- Todas as seis plataformas aparecem como ícones reconhecíveis e com URLs editáveis.
- As fotos usadas pelo carrossel são versões WebP otimizadas; os originais não são modificados.
- O site não possui caminhos absolutos locais nem dependências de hospedagem específicas além de arquivos estáticos e CDNs.
