// lib/data/repositories/categoria_repository.dart

import '../../domain/models/categoria.dart';
import '../services/cade_database.dart';
import 'mappers.dart';

class CategoriaRepository {
  CategoriaRepository({required this._banco});

  final CadeDatabase _banco;

  Future<List<Categoria>> listar() async {
    final linhas = await _banco.listarCategorias();
    return linhas.map((c) => c.paraModel()).toList();
  }
}