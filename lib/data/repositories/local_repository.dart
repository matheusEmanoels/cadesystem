import '../../domain/models/local.dart';
import '../services/cade_database.dart';
import '../services/midia_service.dart';
import 'mappers.dart';

/// Locais onde os objetos são guardados (US03, US10).
class LocalRepository {
  LocalRepository({
    required this._banco,
    required this._midia,
  });

  final CadeDatabase _banco;
  final MidiaService _midia;

  /// Locais em ordem alfabética, para sugestões e filtros.
  Future<List<Local>> listar() async {
    final linhas = await _banco.listarLocais();
    return linhas.map((l) => l.paraModel()).toList();
  }

  /// US10: exclui um local que não tem mais objetos e apaga a foto dele.
  /// Devolve false se o local ainda está em uso (nada é apagado nesse caso).
  Future<bool> excluir(int id) async {
    final todos = await _banco.listarLocais();
    final fotoPath = todos.where((l) => l.id == id).map((l) => l.fotoPath).firstOrNull;

    final excluido = await _banco.excluirLocal(id);
    if (excluido) await _midia.apagar(fotoPath);
    return excluido;
  }
}