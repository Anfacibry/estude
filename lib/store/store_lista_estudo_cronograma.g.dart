// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_lista_estudo_cronograma.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreListaEstudoCronograma on _StoreListaEstudoCronograma, Store {
  late final _$estudoDisciplinaAtom = Atom(
      name: '_StoreListaEstudoCronograma.estudoDisciplina', context: context);

  @override
  EstudoDisciplina get estudoDisciplina {
    _$estudoDisciplinaAtom.reportRead();
    return super.estudoDisciplina;
  }

  @override
  set estudoDisciplina(EstudoDisciplina value) {
    _$estudoDisciplinaAtom.reportWrite(value, super.estudoDisciplina, () {
      super.estudoDisciplina = value;
    });
  }

  late final _$manhaAtom =
      Atom(name: '_StoreListaEstudoCronograma.manha', context: context);

  @override
  ObservableList<EstudoDisciplina> get manha {
    _$manhaAtom.reportRead();
    return super.manha;
  }

  @override
  set manha(ObservableList<EstudoDisciplina> value) {
    _$manhaAtom.reportWrite(value, super.manha, () {
      super.manha = value;
    });
  }

  late final _$tardeAtom =
      Atom(name: '_StoreListaEstudoCronograma.tarde', context: context);

  @override
  ObservableList<EstudoDisciplina> get tarde {
    _$tardeAtom.reportRead();
    return super.tarde;
  }

  @override
  set tarde(ObservableList<EstudoDisciplina> value) {
    _$tardeAtom.reportWrite(value, super.tarde, () {
      super.tarde = value;
    });
  }

  late final _$noiteAtom =
      Atom(name: '_StoreListaEstudoCronograma.noite', context: context);

  @override
  ObservableList<EstudoDisciplina> get noite {
    _$noiteAtom.reportRead();
    return super.noite;
  }

  @override
  set noite(ObservableList<EstudoDisciplina> value) {
    _$noiteAtom.reportWrite(value, super.noite, () {
      super.noite = value;
    });
  }

  late final _$_StoreListaEstudoCronogramaActionController =
      ActionController(name: '_StoreListaEstudoCronograma', context: context);

  @override
  void pegandoEstudoDisciplina(EstudoDisciplina estudo) {
    final _$actionInfo =
        _$_StoreListaEstudoCronogramaActionController.startAction(
            name: '_StoreListaEstudoCronograma.pegandoEstudoDisciplina');
    try {
      return super.pegandoEstudoDisciplina(estudo);
    } finally {
      _$_StoreListaEstudoCronogramaActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estudoDisciplina: ${estudoDisciplina},
manha: ${manha},
tarde: ${tarde},
noite: ${noite}
    ''';
  }
}
