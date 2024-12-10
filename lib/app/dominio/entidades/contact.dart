// um map do banco de dados é convertido em um objeto Contact
class Contact {
  final int? id;
   String nome;
   String telefone;
   String email;

  //construtor
  Contact(
      {required this.id,
      required this.nome,
      required this.telefone,
      required this.email});
}
