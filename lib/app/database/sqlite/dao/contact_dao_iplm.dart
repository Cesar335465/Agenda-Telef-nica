import 'package:pi_agenda/app/database/sqlite/conection.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/dominio/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

// Implementação do DAO
class ContactDaoIplm implements ContactDao {
  // Objeto para fazer as ações DAO
  late Database _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Conection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');

    // Converter a lista MAP para uma lista de Contact
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
        id: linha['id'],
        nome: linha['nome'],
        telefone: linha['telefone'],
        email: linha['email'],
      );
    });

    return lista;
  }

  @override
  Future<void> remove(int id) async {
    _db = await Conection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<void> save(Contact contact) async {
    _db = await Conection.get();

    // Verifica se o contato já existe
    List<Map<String, dynamic>> existingContacts = await _db.query(
      'contact',
      where: 'nome = ? AND telefone = ? AND email = ?',
      whereArgs: [contact.nome, contact.telefone, contact.email],
    );

    if (existingContacts.isEmpty) {
      // Inserir novo contato se não existir
      var sql = 'INSERT INTO contact(nome, telefone, email) VALUES(?,?,?)';
      await _db.rawInsert(sql, [contact.nome, contact.telefone, contact.email]);
    } else {
      // Se já existir, atualiza os dados do contato existente
      var sql =
          'UPDATE contact SET nome = ?, telefone = ?, email = ? WHERE id = ?';
      await _db.rawUpdate(
          sql, [contact.nome, contact.telefone, contact.email, contact.id]);
    }
  }
}
