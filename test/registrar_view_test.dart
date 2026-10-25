import 'package:cadesystem/app.dart';
import 'package:cadesystem/data/services/cade_database.dart';
import 'package:cadesystem/data/services/midia_service.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

/// O teste usa SQLite real em memória e substitui apenas o acesso às mídias.
class _MidiaDeTeste implements MidiaService {
  @override
  Future<void> apagar(String? relativo) async {}

  @override
  Future<void> dispose() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<CadeDatabase> _abrirApp(WidgetTester tester) async {
  final banco = CadeDatabase(NativeDatabase.memory());
  await tester.runAsync(() => banco.listarCategorias());
  await tester.pumpWidget(CadeApp(banco: banco, midia: _MidiaDeTeste()));
  await tester.pumpAndSettle();
  return banco;
}

Future<void> _tocarEmSalvar(WidgetTester tester) async {
  final botao = find.widgetWithText(FilledButton, 'Salvar objeto');
  await tester.ensureVisible(botao);
  await tester.tap(botao);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('abre o cadastro do Cadê e rejeita campos obrigatórios vazios', (
    tester,
  ) async {
    final banco = await _abrirApp(tester);
    expect(find.text('Cadê?'), findsOneWidget);
    expect(find.text('Novo objeto'), findsOneWidget);
    expect(find.textContaining('Flutter Demo'), findsNothing);

    await _tocarEmSalvar(tester);
    expect(find.text('Informe o nome do objeto.'), findsOneWidget);
    expect(find.text('Informe onde você guardou o objeto.'), findsOneWidget);
    final registros = await tester.runAsync(() => banco.buscarObjetos(''));
    expect(registros, isEmpty);
  });

  testWidgets('salva nome e local no banco sem foto e limpa o formulário', (
    tester,
  ) async {
    final banco = await _abrirApp(tester);
    await tester.enterText(
      find.byKey(const ValueKey('nome-objeto')),
      'Documento X',
    );
    await tester.enterText(
      find.byKey(const ValueKey('local-objeto')),
      'Gaveta do escritório',
    );
    await _tocarEmSalvar(tester);
    final registros = await tester.runAsync(
      () => banco.buscarObjetos('Documento X'),
    );
    expect(registros, hasLength(1));
    expect(registros!.single.local.nome, 'Gaveta do escritório');
    expect(registros.single.objeto.fotoPath, isNull);
    expect(registros.single.objeto.registradoEm.year, DateTime.now().year);
    await tester.pumpAndSettle();
    expect(find.text('Objeto salvo no seu aparelho.'), findsOneWidget);
    final campos = tester.widgetList<TextFormField>(find.byType(TextFormField));
    expect(campos.every((campo) => campo.controller!.text.isEmpty), isTrue);
  });

  testWidgets('explica a câmera antes da solicitação e permite desistir', (
    tester,
  ) async {
    await _abrirApp(tester);
    await tester.tap(find.text('Adicionar foto'));
    await tester.pumpAndSettle();
    expect(find.text('Usar câmera'), findsOneWidget);
    expect(
      find.textContaining('As fotos ficam só no seu aparelho.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Agora não'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Novo objeto'), findsOneWidget);
  });

  testWidgets(
    'cadastro permanece utilizável em tela estreita com texto ampliado',
    (tester) async {
      tester.view.physicalSize = const Size(320, 700);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await _abrirApp(tester);
      for (final rotulo in ['Nome do objeto *', 'Onde você guardou? *']) {
        final texto = tester.renderObject<RenderParagraph>(find.text(rotulo));
        expect(texto.didExceedMaxLines, isFalse, reason: rotulo);
      }
      await _tocarEmSalvar(tester);
      expect(find.text('Informe o nome do objeto.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
