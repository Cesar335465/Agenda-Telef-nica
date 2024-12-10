import 'package:flutter/material.dart';
import 'package:pi_agenda/app/view/contact_form.dart';
import 'package:pi_agenda/app/view/contact_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const home = '/';
  static const contactForm = 'contact_form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.green,
      )),
      routes: {
        home: (context) => ContactList(),
        contactForm: (context) => ContactForm()
      },
    );
  }
}
