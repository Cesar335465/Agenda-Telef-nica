// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactListBack on _ContactListBack, Store {
  late final _$listAtom = Atom(name: '_ContactListBack.list', context: context);

  @override
  Future<List<Contact>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  bool _listIsInitialized = false;

  @override
  set list(Future<List<Contact>> value) {
    _$listAtom.reportWrite(value, _listIsInitialized ? super.list : null, () {
      super.list = value;
      _listIsInitialized = true;
    });
  }

  late final _$atualizaListAsyncAction =
      AsyncAction('_ContactListBack.atualizaList', context: context);

  @override
  Future<void> atualizaList([dynamic valor]) {
    return _$atualizaListAsyncAction.run(() => super.atualizaList(valor));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
