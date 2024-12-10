// classe para encapsular as regras de negócio
import 'package:get_it/get_it.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/dominio/exception/domain_exception.dart';
import 'package:pi_agenda/app/dominio/interfaces/contact_dao.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDao>();

  //salver e alterar contato
  save(Contact contact) {
    validaNome(contact.nome);
    validaTelefone(contact.telefone);
    validaEmail(contact.email);
    _dao.save(contact);
  }

  // remover contato
  remove(int id) {
    _dao.remove(id);
  }

  //listar contato
  Future<List<Contact>> find() {
    return _dao.find();
  }

  validaNome(String nome) {
    var min = 3;
    var max = 200;

    if (nome.isEmpty) {
      throw DomainException('O nome é obrigatório!');
    } else if (nome.length < min) {
      throw DomainException('O nome deve ter pelo menos $min caracteres!');
    } else if (nome.length > max) {
      throw DomainException('O nome ultrapassa $max caracteres.');
    }
  }

  validaEmail(String email) {
    if (email.isEmpty) {
      throw DomainException('O e-mail é obrigatório!');
    } else if (!email.contains('@')) {
      throw DomainException('Informe o @ do e-mail');
    }
  }

  validaTelefone(String telefone) {
    var formato = RegExp(r'\(\d{2}\)[1-9] \d{4}-\d{4}'); //(XX)X XXXX-XXXX
    if (telefone.isEmpty) {
      throw DomainException('O telefone é obrigatório!');
    } else if (!formato.hasMatch(telefone)) {
      throw DomainException('O formato do telefone deve ser (XX)X XXXX-XXXX.');
    }
  }
}
