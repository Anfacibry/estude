import 'package:estude/data/model/estudo_disciplina.dart';
import 'package:mobx/mobx.dart';

part 'store_lista_estudo_cronograma.g.dart';

// ignore: library_private_types_in_public_api
class StoreListaEstudoCronograma = _StoreListaEstudoCronograma
    with _$StoreListaEstudoCronograma;

abstract class _StoreListaEstudoCronograma with Store {
  @observable
  EstudoDisciplina estudoDisciplina = EstudoDisciplina(
    idEstudoDisciplina: "",
    idDisciplina: "",
    dia: [],
    turno: 0,
    tempo: "",
  );

  @action
  void pegandoEstudoDisciplina(EstudoDisciplina estudo) {
    estudoDisciplina = estudo;
  }

  @observable
  ObservableList<EstudoDisciplina> manha = ObservableList();
  @observable
  ObservableList<EstudoDisciplina> tarde = ObservableList();
  @observable
  ObservableList<EstudoDisciplina> noite = ObservableList();
}
