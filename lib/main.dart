import 'package:flutter/material.dart';
import 'package:pi_agenda/app/injection.dart';
import 'package:pi_agenda/app/my_app_config.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}
