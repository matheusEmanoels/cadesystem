class Local {
  final int id;
  final String nome;
  final String? fotoPath;

  const Local({
    required this.id,
    required this.nome,
    this.fotoPath,
  });

  bool get temFoto => fotoPath != null;

  Local copyWith({String? nome, String? fotoPath}) {
    return Local(
      id: id,
      nome: nome ?? this.nome,
      fotoPath: fotoPath ?? this.fotoPath,
    );
  }

  @override
  bool operator ==(Object other) => other is Local && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Local(id: $id, nome: $nome)';
}