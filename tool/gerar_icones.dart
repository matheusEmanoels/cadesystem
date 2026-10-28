import 'dart:convert';
import 'dart:io';

/// Exporta os ícones preservando uma configuração do template atual do Xcode.
Future<void> main() async {
  final projetoIos = File('ios/Runner.xcodeproj/project.pbxproj');
  final configuracao = RegExp(
    r'ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS\s*=\s*[^;]+;',
  );
  final valoresOriginais = configuracao
      .allMatches(projetoIos.readAsStringSync())
      .map((match) => match.group(0)!)
      .toList();

  try {
    final resultado = await Process.run(
      Platform.resolvedExecutable,
      ['run', 'flutter_launcher_icons'],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    stdout.write(resultado.stdout);
    stderr.write(resultado.stderr);
    exitCode = resultado.exitCode;
  } finally {
    // A versão 0.14.4 também troca indevidamente o valor desta opção booleana.
    // Restauramos somente essa opção, mantendo os ícones e demais alterações.
    final gerado = projetoIos.readAsStringSync();
    if (configuracao.allMatches(gerado).length != valoresOriginais.length) {
      throw StateError('Revise as configurações de assets do projeto iOS.');
    }
    var indice = 0;
    final corrigido = gerado.replaceAllMapped(
      configuracao,
      (_) => valoresOriginais[indice++],
    );
    if (corrigido != gerado) projetoIos.writeAsStringSync(corrigido);
  }
}
