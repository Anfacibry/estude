// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreState on _StoreState, Store {
  late final _$indexSelectScreenAtom =
      Atom(name: '_StoreState.indexSelectScreen', context: context);

  @override
  int get indexSelectScreen {
    _$indexSelectScreenAtom.reportRead();
    return super.indexSelectScreen;
  }

  @override
  set indexSelectScreen(int value) {
    _$indexSelectScreenAtom.reportWrite(value, super.indexSelectScreen, () {
      super.indexSelectScreen = value;
    });
  }

  late final _$isEstudoConcluidoAtom =
      Atom(name: '_StoreState.isEstudoConcluido', context: context);

  @override
  bool get isEstudoConcluido {
    _$isEstudoConcluidoAtom.reportRead();
    return super.isEstudoConcluido;
  }

  @override
  set isEstudoConcluido(bool value) {
    _$isEstudoConcluidoAtom.reportWrite(value, super.isEstudoConcluido, () {
      super.isEstudoConcluido = value;
    });
  }

  late final _$isPlayAtom = Atom(name: '_StoreState.isPlay', context: context);

  @override
  bool get isPlay {
    _$isPlayAtom.reportRead();
    return super.isPlay;
  }

  @override
  set isPlay(bool value) {
    _$isPlayAtom.reportWrite(value, super.isPlay, () {
      super.isPlay = value;
    });
  }

  late final _$idDisciplinaAtom =
      Atom(name: '_StoreState.idDisciplina', context: context);

  @override
  String get idDisciplina {
    _$idDisciplinaAtom.reportRead();
    return super.idDisciplina;
  }

  @override
  set idDisciplina(String value) {
    _$idDisciplinaAtom.reportWrite(value, super.idDisciplina, () {
      super.idDisciplina = value;
    });
  }

  late final _$nomdeDisciplinaAtom =
      Atom(name: '_StoreState.nomdeDisciplina', context: context);

  @override
  String get nomdeDisciplina {
    _$nomdeDisciplinaAtom.reportRead();
    return super.nomdeDisciplina;
  }

  @override
  set nomdeDisciplina(String value) {
    _$nomdeDisciplinaAtom.reportWrite(value, super.nomdeDisciplina, () {
      super.nomdeDisciplina = value;
    });
  }

  late final _$horasAtom = Atom(name: '_StoreState.horas', context: context);

  @override
  int get horas {
    _$horasAtom.reportRead();
    return super.horas;
  }

  @override
  set horas(int value) {
    _$horasAtom.reportWrite(value, super.horas, () {
      super.horas = value;
    });
  }

  late final _$minutoAtom = Atom(name: '_StoreState.minuto', context: context);

  @override
  int get minuto {
    _$minutoAtom.reportRead();
    return super.minuto;
  }

  @override
  set minuto(int value) {
    _$minutoAtom.reportWrite(value, super.minuto, () {
      super.minuto = value;
    });
  }

  late final _$turnoEscolhidoAtom =
      Atom(name: '_StoreState.turnoEscolhido', context: context);

  @override
  int get turnoEscolhido {
    _$turnoEscolhidoAtom.reportRead();
    return super.turnoEscolhido;
  }

  @override
  set turnoEscolhido(int value) {
    _$turnoEscolhidoAtom.reportWrite(value, super.turnoEscolhido, () {
      super.turnoEscolhido = value;
    });
  }

  late final _$idEstudoDisciplinaAtom =
      Atom(name: '_StoreState.idEstudoDisciplina', context: context);

  @override
  String get idEstudoDisciplina {
    _$idEstudoDisciplinaAtom.reportRead();
    return super.idEstudoDisciplina;
  }

  @override
  set idEstudoDisciplina(String value) {
    _$idEstudoDisciplinaAtom.reportWrite(value, super.idEstudoDisciplina, () {
      super.idEstudoDisciplina = value;
    });
  }

  late final _$diaEscolhidoAtom =
      Atom(name: '_StoreState.diaEscolhido', context: context);

  @override
  int get diaEscolhido {
    _$diaEscolhidoAtom.reportRead();
    return super.diaEscolhido;
  }

  @override
  set diaEscolhido(int value) {
    _$diaEscolhidoAtom.reportWrite(value, super.diaEscolhido, () {
      super.diaEscolhido = value;
    });
  }

  late final _$nomeDaSemanaAtom =
      Atom(name: '_StoreState.nomeDaSemana', context: context);

  @override
  DateTime get nomeDaSemana {
    _$nomeDaSemanaAtom.reportRead();
    return super.nomeDaSemana;
  }

  @override
  set nomeDaSemana(DateTime value) {
    _$nomeDaSemanaAtom.reportWrite(value, super.nomeDaSemana, () {
      super.nomeDaSemana = value;
    });
  }

  late final _$_StoreStateActionController =
      ActionController(name: '_StoreState', context: context);

  @override
  void selectScreen(int index) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.selectScreen');
    try {
      return super.selectScreen(index);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void concluirEstudo() {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.concluirEstudo');
    try {
      return super.concluirEstudo();
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void paly() {
    final _$actionInfo =
        _$_StoreStateActionController.startAction(name: '_StoreState.paly');
    try {
      return super.paly();
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionandoIdDisciplina(String disciplinaPega) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.selecionandoIdDisciplina');
    try {
      return super.selecionandoIdDisciplina(disciplinaPega);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionandoNomeDisciplina(String disciplinaPega) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.selecionandoNomeDisciplina');
    try {
      return super.selecionandoNomeDisciplina(disciplinaPega);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionandoHoras(int horasPegas) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.selecionandoHoras');
    try {
      return super.selecionandoHoras(horasPegas);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionandoMinutos(int minutosPego) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.selecionandoMinutos');
    try {
      return super.selecionandoMinutos(minutosPego);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void escolhendoTurno(int turno) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.escolhendoTurno');
    try {
      return super.escolhendoTurno(turno);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pegandoId(String id) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.pegandoId');
    try {
      return super.pegandoId(id);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void escolhendoDiaDaSemana(int dia) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.escolhendoDiaDaSemana');
    try {
      return super.escolhendoDiaDaSemana(dia);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void escolhendoNomeSemana(DateTime nomeSemana) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.escolhendoNomeSemana');
    try {
      return super.escolhendoNomeSemana(nomeSemana);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexSelectScreen: ${indexSelectScreen},
isEstudoConcluido: ${isEstudoConcluido},
isPlay: ${isPlay},
idDisciplina: ${idDisciplina},
nomdeDisciplina: ${nomdeDisciplina},
horas: ${horas},
minuto: ${minuto},
turnoEscolhido: ${turnoEscolhido},
idEstudoDisciplina: ${idEstudoDisciplina},
diaEscolhido: ${diaEscolhido},
nomeDaSemana: ${nomeDaSemana}
    ''';
  }
}
