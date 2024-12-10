import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/dominio/services/contact_service.dart';

// funcionamento e gestão do estado usando o mobx da tela de cadastro/alteração do contato
class ContactFormBack {
  late Contact contact;
  final _service = GetIt.I.get<ContactService>();

  bool _nomeIsValid = false;
  bool _telefoneIsValid = false;
  bool _emailIsValid = false;

  // validação geral
  bool get isValid => _nomeIsValid && _telefoneIsValid && _emailIsValid;

// construtor para diferenciar a edição e cadastramento de um contato
  ContactFormBack(BuildContext context) {
    var parametro = ModalRoute.of(context)?.settings.arguments;
    contact = (parametro == null)
        ? Contact(id: null, nome: '', telefone: '', email: '')
        : parametro as Contact;
  }

  //salvar
  save() async {
    await _service.save(contact);
  }

  // validações
  String? validaNome(String nome) {
    try {
      _service.validaNome(nome);
      _nomeIsValid = true;
      return null;
    } catch (e) {
      _nomeIsValid = false;
      return e.toString();
    }
  }

  String? validaEmail(String email) {
    try {
      _service.validaEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String? validaTelefone(String telefone) {
    try {
      _service.validaTelefone(telefone);
      _telefoneIsValid = true;
      return null;
    } catch (e) {
      _telefoneIsValid = false;
      return e.toString();
    }
  }
}