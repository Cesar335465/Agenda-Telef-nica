import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pi_agenda/app/view/contact_form_back.dart';

class ContactForm extends StatelessWidget {
  // referência do widget formulário
  final _formRef = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro de contato',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              //validate vai chamar as validações dos campos
              _formRef.currentState?.validate();
              _formRef.currentState?.save();
              if (_back.isValid) {
                _back.save();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _formRef,
            child: Column(
              children: [
                fieldNome(_back),
                fieldTelefone(_back),
                fieldEmail(_back),
              ],
            )),
      ),
    );
  }

  Widget fieldNome(ContactFormBack back) {
    return TextFormField(
      validator: (value) => back.validaNome(value ?? ''),
      onSaved: (newValue) => back.contact.nome = newValue ?? '',
      initialValue: back.contact.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget fieldTelefone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(
        mask: '(##)# ####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      validator: (value) => back.validaTelefone(value ?? ''),
      onSaved: (newValue) => back.contact.telefone = newValue ?? '',
      initialValue: back.contact.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(labelText: 'Telefone:', hintText: '(99)9 9999-9999'),
    );
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'E-mail:'),
      validator: (value) => back.validaEmail(value ?? ''),
      onSaved: (newValue) => back.contact.email = newValue ?? '',
      initialValue: back.contact.email,
    );
  }
}
