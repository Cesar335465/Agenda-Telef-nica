import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/dominio/services/contact_service.dart';
import 'package:pi_agenda/app/my_app_config.dart';

//caminho do arquivo gerado pelo mobx
part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  // quando o construtor for inicializada a lista será construida
  _ContactListBack() {
    atualizaList();
  }

  final _service = GetIt.I.get<ContactService>();

  // Lista de contatos
  @observable
  late Future<List<Contact>> list;

  // Método para atualizar a lista
  @action
  Future<void> atualizaList([dynamic valor]) async {
    list = _service.find();
  }

  // Método para chamar o form salvar e alterar
  chamaForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.contactForm, arguments: contact)
        .then(atualizaList);
  }

  // Método para excluir contato
  remove(int id) {
    _service.remove(id);
    atualizaList();
  }
}
