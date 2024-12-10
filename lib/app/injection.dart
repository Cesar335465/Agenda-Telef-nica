import 'package:get_it/get_it.dart';
import 'package:pi_agenda/app/database/sqlite/dao/contact_dao_iplm.dart';
import 'package:pi_agenda/app/dominio/interfaces/contact_dao.dart';
import 'package:pi_agenda/app/dominio/services/contact_service.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDao>(ContactDaoIplm());
  getIt.registerSingleton<ContactService>(ContactService());
}
