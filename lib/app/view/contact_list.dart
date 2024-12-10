import 'package:flutter/material.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';
import 'package:pi_agenda/app/view/contact_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  ContactList({super.key});

  // método para botão de editar
  Widget botaoEdit(Function onPressed) {
    return IconButton(
      onPressed: () => onPressed(), // Chama a função recebida
      icon: Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  // método para botão de excluir
  Widget botaoDelete(BuildContext context, Function remove) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir Contato'),
            content: Text('Confirma a exclusão?'),
            actions: [
              TextButton(
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Sim'),
                onPressed: () {
                  remove();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      icon: Icon(Icons.delete),
      color: Colors.redAccent.shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        actions: [
          IconButton(
              onPressed: () {
                _back.chamaForm(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Observer(
        builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (futuro.connectionState == ConnectionState.waiting) {
                // Enquanto os dados estão sendo buscados, mostre um indicador de progresso
                return const Center(child: CircularProgressIndicator());
              } else if (futuro.hasError) {
                // Caso ocorra um erro durante a busca, mostre uma mensagem de erro
                return Center(child: Text('Erro: ${futuro.error}'));
              } else if (futuro.hasData) {
                List<Contact>? lista = futuro.data;
                if (lista == null || lista.isEmpty) {
                  return const Center(
                      child: Text('Nenhum contato encontrado.'));
                }
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    return ListTile(
                      title: Text(contato.nome),
                      subtitle: Text('${contato.telefone} - ${contato.email}'),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            botaoEdit(() {
                              // Ação de edição
                              _back.chamaForm(context, contato);
                            }),
                            botaoDelete(context, () {
                              _back.remove(
                                  contato.id!); //Deustador de Pintos Negros
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                // Caso não tenha dados (hasData == false) e não esteja esperando (waiting == false)
                return const Center(child: Text('Nenhum dado disponível.'));
              }
            },
          );
        },
      ),
    );
  }
}
