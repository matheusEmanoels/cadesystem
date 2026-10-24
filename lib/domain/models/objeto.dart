class Objeto {
  final int id;
  final String nome;
  final String? fotoPath;
  final String? audioPath;
  final String? descricao;
  final int localId;
  final int? categoriaId;
  final int tamanhoBytes;
  final DateTime registradoEm;
  final DateTime confirmadoEm;

  const Objeto({
    required this.id,
    required this.nome,
    required this.localId,
    required this.registradoEm,
    required this.confirmadoEm,
    this.fotoPath,
    this.audioPath,
    this.descricao,
    this.categoriaId,
    this.tamanhoBytes = 0,
  });

  bool get temFoto => fotoPath != null;
  bool get temAudio => audioPath != null;

  bool registroAntigo({int meses = 11, DateTime? agora}) {
    final limite = (agora ?? DateTime.now()).subtract(Duration(days: meses * 30));
    return confirmadoEm.isBefore(limite);
  }

  Objeto copyWith({
    String? nome,
    String? fotoPath,
    String? audioPath,
    String? descricao,
    int? localId,
    int? categoriaId,
    int? tamanhoBytes,
    DateTime? confirmadoEm,
  }) {
    return Objeto(
      id: id,
      nome: nome ?? this.nome,
      fotoPath: fotoPath ?? this.fotoPath,
      audioPath: audioPath ?? this.audioPath,
      descricao: descricao ?? this.descricao,
      localId: localId ?? this.localId,
      categoriaId: categoriaId ?? this.categoriaId,
      tamanhoBytes: tamanhoBytes ?? this.tamanhoBytes,
      registradoEm: registradoEm,
      confirmadoEm: confirmadoEm ?? this.confirmadoEm,
    );
  }

  @override
  bool operator ==(Object other) => other is Objeto && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Objeto(id: $id, nome: $nome, localId: $localId)';
}