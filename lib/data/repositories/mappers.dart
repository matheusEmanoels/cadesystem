// lib/data/repositories/mappers.dart
//
// Conversão das linhas do banco (ObjetoRow, LocalRow, CategoriaRow, geradas
// pelo Drift) nos models do domínio. Só os repositories importam este arquivo:
// as camadas de cima nunca veem tipos do banco.

import '../../domain/models/categoria.dart';
import '../../domain/models/local.dart';
import '../../domain/models/objeto.dart';
import '../services/cade_database.dart';

extension ObjetoRowParaModel on ObjetoRow {
  Objeto paraModel() => Objeto(
        id: id,
        nome: nome,
        fotoPath: fotoPath,
        audioPath: audioPath,
        descricao: descricao,
        localId: localId,
        categoriaId: categoriaId,
        tamanhoBytes: tamanhoBytes,
        registradoEm: registradoEm,
        confirmadoEm: confirmadoEm,
      );
}

extension LocalRowParaModel on LocalRow {
  Local paraModel() => Local(id: id, nome: nome, fotoPath: fotoPath);
}

extension CategoriaRowParaModel on CategoriaRow {
  Categoria paraModel() => Categoria(id: id, nome: nome);
}