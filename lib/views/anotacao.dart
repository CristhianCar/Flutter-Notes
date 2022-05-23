class Anotacao {
  final String? titulo;
  final String? descricao;

  Anotacao(this.titulo, this.descricao);

  @override
  String toString() {
    // TODO: implement toString
    return 'Anotação{ título: $titulo, descricão: $descricao}';
  }
}
