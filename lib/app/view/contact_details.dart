import 'package:flutter/material.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/view/contact_details_back.dart';

// mostra as informações detalhadas de cada contato
class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        /* var largura = constraints.biggest.width;
        var altura = constraints.biggest.height;
 */
        return Scaffold(
            body: ListView(
              children: [
                Center(
                  child: Text(
                    '${contact.nome}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Telefone'),
                    subtitle: Text('${contact.telefone}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('E-mail'),
                    subtitle: Text('${contact.email}'),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  _back.chamaBack();
                }));
      },
    );
  }
}
