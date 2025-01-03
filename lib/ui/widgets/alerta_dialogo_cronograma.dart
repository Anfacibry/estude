import 'package:estude/data/model/disciplina.dart';
import 'package:estude/data/model/estudo_disciplina.dart';
import 'package:estude/data/services/obtendo_dados.dart';
import 'package:estude/domain/store/store_state.dart';
import 'package:estude/ui/widgets/botao_elevado_dialogo_cronograma.dart';
import 'package:estude/utils/responsividade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/db_estudo_disciplina.dart';
import '../../utils/data_constante.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/app_style_text.dart';

class AlertDialogCronograma extends StatelessWidget {
  final double height;
  final double width;
  final bool isEditarDisciplinaCronograma;
  final void Function() funDelete;
  final EstudoDisciplina? estudoDisciplina;
  const AlertDialogCronograma({
    required this.height,
    required this.width,
    required this.isEditarDisciplinaCronograma,
    required this.estudoDisciplina,
    required this.funDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final StoreState storeState =
        Provider.of<StoreState>(context, listen: false);

    return AlertDialog(
      title: isEditarDisciplinaCronograma
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    "Organizar disciplinas",
                    style: AppStyleText.textoOnPrimaryContainer(
                        context: context, size: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: funDelete,
                    icon: const Icon(Icons.delete_rounded),
                    color: Theme.of(context).colorScheme.error,
                  ),
                )
              ],
            )
          : Text(
              "Organizar disciplinas",
              textAlign: TextAlign.center,
              style: AppStyleText.textoOnPrimaryContainer(
                  context: context, size: 20),
            ),
      content: SizedBox(
        height: height * .4,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .05,
              width: width,
              padding: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (context) => Text(
                      storeState.nomdeDisciplina,
                      style: const TextStyle(color: AppColor.textFormeField),
                    ),
                  ),
                  FutureBuilder(
                      future: listaDisciplinas(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            final List<Disciplina> listaDisciplinaPega =
                                snapshot.data!;
                            return listaDisciplinaPega.isNotEmpty
                                ? PopupMenuButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColor.textFormeField,
                                    ),
                                    itemBuilder: (context) => [
                                          for (Disciplina disciplina
                                              in listaDisciplinaPega)
                                            PopupMenuItem(
                                              child: Text(
                                                disciplina.nomeDisciplina,
                                                style:
                                                    AppStyleText.textoOnPrimary(
                                                        context: context),
                                              ),
                                              onTap: () {
                                                storeState
                                                    .selecionandoIdDisciplina(
                                                        disciplina
                                                            .idDisciplina);
                                                storeState
                                                    .selecionandoNomeDisciplina(
                                                        disciplina
                                                            .nomeDisciplina);
                                              },
                                            )
                                        ])
                                : PopupMenuButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColor.textFormeField,
                                    ),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: Observer(
                                                builder: (context) => Text(
                                                    storeState.idDisciplina)),
                                          )
                                        ]);
                          case ConnectionState.waiting:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.active:
                            return const SizedBox();
                          case ConnectionState.none:
                            return const SizedBox();
                          // default:
                          //   return const SizedBox();
                        }
                      })
                ],
              ),
            ),
            AppResponsiv.paddingTop(height * .02),
            SizedBox(
              height: height * .1,
              width: width,
              child: Observer(
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Turno",
                      style: AppStyleText.textoOnPrimaryContainer(
                          context: context, size: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BotaoElevadoDialogoCronograma(
                          title: "Manhã",
                          isTurno: storeState.turnoEscolhido == 1,
                          fun: () {
                            storeState.escolhendoTurno(1);
                          },
                        ),
                        BotaoElevadoDialogoCronograma(
                          title: "Tarde",
                          isTurno: storeState.turnoEscolhido == 2,
                          fun: () {
                            storeState.escolhendoTurno(2);
                          },
                        ),
                        BotaoElevadoDialogoCronograma(
                          title: "Noite",
                          isTurno: storeState.turnoEscolhido == 3,
                          fun: () {
                            storeState.escolhendoTurno(3);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text("Dias da semana"),
            AppResponsiv.paddingTop(height * .02),
            SizedBox(
              height: height * .1,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Termpo de estudo",
                    style: AppStyleText.textoOnPrimaryContainer(
                        context: context, size: 20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay tempo = const TimeOfDay(hour: 00, minute: 00);
                      final TimeOfDay? horas = await showTimePicker(
                        context: context,
                        initialTime: tempo,
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if (horas != null) {
                        tempo = horas;
                        storeState
                            .selecionandoTempo("${tempo.hour}:${tempo.minute}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Observer(
                      builder: (context) => Text(storeState.tempo),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            if (isEditarDisciplinaCronograma) {
              EstudoDisciplina estudoDisciplina = EstudoDisciplina(
                idEstudoDisciplina: storeState.idEstudoDisciplina,
                idDisciplina: storeState.idDisciplina,
                turno: storeState.turnoEscolhido,
                dia: [1, 6, 7],
                tempo: storeState.tempo,
              );
              debugPrint(estudoDisciplina.toString());
              atualizandoEstudoDisciplina(estudoDisciplina);

              Navigator.pop(context);
            } else {
              EstudoDisciplina estudoDisciplina = EstudoDisciplina(
                idEstudoDisciplina: uuid.v8(),
                idDisciplina: storeState.idDisciplina,
                turno: storeState.turnoEscolhido,
                dia: [1, 6, 7],
                tempo: storeState.tempo,
              );

              insertEstudoDisciplina(estudoDisciplina);

              Navigator.pop(context);
            }
          },
          child: isEditarDisciplinaCronograma
              ? const Text("Atualizar")
              : const Text("Adicionar"),
        ),
      ],
    );
  }
}
