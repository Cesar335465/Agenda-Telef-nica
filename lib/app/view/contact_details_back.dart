import 'package:flutter/material.dart';
import 'package:pi_agenda/app/dominio/entidades/contact.dart';

class ContactDetailsBack {
  BuildContext context;
  late Contact contact;

  //construtor
  ContactDetailsBack(this.context){
    contact = ModalRoute.of(context)?.settings.arguments as Contact;
  }

  chamaBack() {
    Navigator.of(context).pop();
  }
}
