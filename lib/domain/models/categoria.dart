class Categoria {
  final int id;
  final String nome;

  const Categoria({required this.id, required this.nome});

  @override
  bool operator ==(Object other) => other is Categoria && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Categoria(id: $id, nome: $nome)';
}