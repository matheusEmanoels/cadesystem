# Identidade visual do Cadê

Geradas com a ferramenta integrada `imagegen`, sem uso de API por script. As artes são novas; não são imagens do Flutter. O roxo foi escolhido por já ser a cor-base do aplicativo.

- [cade-icon.png](../assets/branding/cade-icon.png): ícone quadrado com fundo roxo opaco, exportado nos tamanhos do launcher Android/iOS.
- [cade-drawer.png](../assets/branding/cade-drawer.png): ilustração com transparência real, aplicada à interface de cadastro. A transparência foi conferida no arquivo.

## Prompt do ícone

Create one production-ready square app launcher icon for Cadê, a simple personal offline app that remembers where physical objects were stored. Brand cue already in project: Material deep purple (#673AB7), lavender, white. Image only, no words, letters, numbers, Flutter symbols, watermarks or presentation mockups. A single bold original mark: a white magnifying glass cleverly combined with a small office drawer, making the idea of finding a stored object immediately clear. Flat crisp rounded geometry, minimal details, extremely legible at 48 pixels. Solid deep purple full-bleed square background (no outer rounded-corner mask, no device frame), centered mark occupying central 60 percent with generous safe margins for Android adaptive icon masks. High contrast, polished restrained utility-app identity. Output just the icon artwork, square 1024x1024.

## Prompt da ilustração

Create a single compact illustration asset for the registration screen of Cadê, a mobile app for remembering where objects were stored. Subject: one open office drawer with a neatly stored paper document and a small magnifying glass beside the drawer. Use only deep purple (#673AB7), soft lavender and off-white to match an existing Material purple app. Friendly clean flat illustration with softly rounded forms, very subtle depth, simple silhouette and few details; mature utility app, not a cartoon mascot. Centered isolated composition, generous empty transparent padding, visually balanced as a small header illustration. No text, letters, labels, numbers, logos, Flutter marks, device mockups, checkerboard background or surrounding room. Genuine transparent background. Output only the isolated illustration, square canvas.

## Aplicação

Os arquivos usados pelo aplicativo ficam em `assets/branding/` e estão declarados no `pubspec.yaml`. Os originais gerados também foram preservados no diretório de imagens do Codex.

A branch `style/personalizar-cade` foi criada da `develop` após o merge do cadastro (PR #5). A tela mostra a marca no cabeçalho, a ilustração acima do formulário e ícones Material de objeto, localização, salvar e cancelar. Esses ícones de controles continuam usando a biblioteca já adotada pelo Flutter; a marca e a ilustração são próprias do Cadê. As regras do cadastro e o armazenamento não foram alterados.

Os nomes exibidos no launcher Android e no iOS passaram a ser `Cadê?`. Identificadores internos do aplicativo foram preservados.

## Regenerar ícones nativos

O pacote de desenvolvimento `flutter_launcher_icons` exporta os tamanhos Android/iOS a partir do ícone principal. A configuração fica em `flutter_launcher_icons.yaml`; `remove_alpha_ios` garante ícones sem transparência no catálogo do iOS.

```powershell
fvm flutter pub get
fvm dart run tool/gerar_icones.dart
```

Os PNGs nativos gerados devem acompanhar o commit da imagem de origem. A geração não precisa ser repetida a cada execução do aplicativo.

O script chama o gerador pelo Dart do FVM e preserva `ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS` no projeto Xcode. Na versão 0.14.4, o gerador também substitui indevidamente essa opção booleana pelo nome do ícone. O script restaura seu valor original, sem desfazer a exportação das imagens. Esse comportamento foi identificado ao revisar o diff dos arquivos gerados.

## Validação

Os testes existentes do cadastro continuam cobrindo validação, salvamento, explicação da câmera e rótulos em tela estreita com texto ampliado. Os localizadores dos testes foram ajustados para o botão com ícone e para a rolagem até a câmera, sem mudar as regras verificadas.

O ícone iOS é gerado como recurso estático; a compilação do aplicativo iOS continua dependendo de validação em ambiente Apple.
