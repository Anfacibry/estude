import 'package:mobx/mobx.dart';

part "store_state.g.dart";

// ignore: library_private_types_in_public_api
class StoreState = _StoreState with _$StoreState;

abstract class _StoreState with Store {
  @observable
  int indexSelectScreen = 0;

  @action
  void selectScreen(int index) {
    indexSelectScreen = index;
  }

  @observable
  bool isEstudoConcluido = false;

  @action
  void concluirEstudo() {
    isEstudoConcluido = !isEstudoConcluido;
  }

  @observable
  bool isPlay = false;

  @action
  void paly() {
    isPlay = !isPlay;
  }

  @observable
  String idDisciplina = "";

  @action
  void selecionandoIdDisciplina(String disciplinaPega) {
    idDisciplina = disciplinaPega;
  }

  @observable
  String nomdeDisciplina = "Selecionar disciplina";

  @action
  void selecionandoNomeDisciplina(String disciplinaPega) {
    nomdeDisciplina = disciplinaPega;
  }

  @observable
  int horas = 0;
  @action
  void selecionandoHoras(int horasPegas) {
    horas = horasPegas;
  }

  @observable
  int minuto = 0;
  @action
  void selecionandoMinutos(int minutosPego) {
    minuto = minutosPego;
  }

  @observable
  int turnoEscolhido = 1;

  @action
  void escolhendoTurno(int turno) {
    turnoEscolhido = turno;
  }

  @observable
  String idEstudoDisciplina = "";
  @action
  void pegandoId(String id) {
    idEstudoDisciplina = id;
  }

  @observable
  int diaEscolhido = 0;

  @action
  void escolhendoDiaDaSemana(int dia) {
    diaEscolhido = dia;
  }

  @observable
  DateTime nomeDaSemana = DateTime.now();
  @action
  void escolhendoNomeSemana(DateTime nomeSemana) {
    nomeDaSemana = nomeSemana;
  }
}
