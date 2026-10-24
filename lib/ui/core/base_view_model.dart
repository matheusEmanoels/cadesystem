// lib/ui/core/base_view_model.dart

import 'package:flutter/foundation.dart';

/// Estados que toda tela trata do mesmo jeito: o app nunca fica travado
/// sem explicação.
enum EstadoTela { inicial, carregando, sucesso, vazio, erro }

abstract class BaseViewModel extends ChangeNotifier {
  EstadoTela _estado = EstadoTela.inicial;
  String? _mensagemErro;
  bool _descartado = false;

  EstadoTela get estado => _estado;
  String? get mensagemErro => _mensagemErro;
  bool get carregando => _estado == EstadoTela.carregando;

  /// Muda o estado da tela inteira (carregando, vazio, erro...).
  void definirEstado(EstadoTela novo, {String? erro}) {
    _estado = novo;
    _mensagemErro = erro;
    notifyListeners();
  }

  /// Mostra um erro sem trocar o estado da tela (ex.: falha ao salvar um
  /// formulário que deve continuar visível).
  void mostrarErro(String mensagem) {
    _mensagemErro = mensagem;
    notifyListeners();
  }

  void limparErro() {
    if (_mensagemErro == null) return;
    _mensagemErro = null;
    notifyListeners();
  }

  // Evita "notifyListeners após dispose" quando uma operação assíncrona
  // termina depois que o usuário já saiu da tela.
  @override
  void notifyListeners() {
    if (!_descartado) super.notifyListeners();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}