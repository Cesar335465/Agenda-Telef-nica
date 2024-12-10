// definir o que o DAO vai fazer

import 'package:pi_agenda/app/dominio/entidades/contact.dart';

abstract class ContactDao {
  // salvar e alterar
  save(Contact contact);

  //remover um contato
  remove(int id);

  // buscar todos contatos
  Future<List<Contact>> find();
}
