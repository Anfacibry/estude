import 'package:estude/data/model/estudo_disciplina.dart';
import 'package:estude/data/services/obtendo_dados.dart';
import 'package:estude/ui/widgets/card_diciplinas_turnos.dart';

import 'package:estude/domain/store/store_state.dart';

import 'package:estude/utils/responsividade.dart';

import 'package:estude/utils/theme/app_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/data_constante.dart';
import '../widgets/alerta_dialogo_cronograma.dart';

class Cronograma extends StatefulWidget {
  const Cronograma({super.key});

  @override
  State<Cronograma> createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> {
  @override
  Widget build(BuildContext context) {
    listaFiltrada();
    final ({double height, double width}) size =
        AppResponsiv.sizeLayout(context);
    final StoreState state = Provider.of<StoreState>(context, listen: false);

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: size.height * .06,
              width: size.width,
              margin: EdgeInsets.only(
                top: size.height * .01,
                bottom: size.height * .01,
                right: size.width * .02,
                left: size.width * .02,
              ),
              padding: EdgeInsets.only(
                  right: size.width * .01, left: size.width * .02),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(
                      builder: (context) => Text(
                        DateFormat("EEEE", "pt-BR").format(state.nomeDaSemana),
                        style: AppStyleText.textoOnPrimary(
                            context: context, size: constraints.maxHeight * .5),
                      ),
                    ),
                    PopupMenuButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: constraints.maxHeight * .8,
                      ),
                      itemBuilder: (context) => [
                        for (DateTime nome in listaDatas)
                          PopupMenuItem(
                            child: Text(
                              DateFormat("EEEE", "pt-BR").format(nome),
                              style:
                                  AppStyleText.textoOnPrimary(context: context),
                            ),
                            onTap: () {
                              state.escolhendoNomeSemana(nome);
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.none,
                width: size.width,
                padding: EdgeInsets.only(
                  right: size.width * .05,
                  left: size.width * .05,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(size.width * .1))),
                child: FutureBuilder(
                    future: listaFiltrada(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          List<List<EstudoDisciplina>> listCompleta =
                              snapshot.data!;
                          return listCompleta.isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AppResponsiv.paddingTop(
                                          size.height * .05),
                                      listCompleta[0].isNotEmpty
                                          ? CardDiciplinasTurnos(
                                              isEditar: true,
                                              estudoDisciplinas:
                                                  listCompleta[0],
                                              turno: "Manhã",
                                              height: size.height,
                                              width: size.width,
                                              funDeletar: () {},
                                              fun: () {},
                                            )
                                          : const SizedBox(),
                                      AppResponsiv.paddingTop(
                                          size.height * .05),
                                      listCompleta[1].isNotEmpty
                                          ? CardDiciplinasTurnos(
                                              isEditar: true,
                                              estudoDisciplinas:
                                                  listCompleta[1],
                                              turno: "Tarde",
                                              height: size.height,
                                              width: size.width,
                                              funDeletar: () {},
                                              fun: () {},
                                            )
                                          : const SizedBox(),
                                      AppResponsiv.paddingTop(
                                          size.height * .05),
                                      listCompleta[2].isNotEmpty
                                          ? CardDiciplinasTurnos(
                                              isEditar: true,
                                              estudoDisciplinas:
                                                  listCompleta[2],
                                              turno: "Noite",
                                              height: size.height,
                                              width: size.width,
                                              funDeletar: () {},
                                              fun: () {},
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "Lista vazia",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                );

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
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialogCronograma(
              estudoDisciplina: null,
              isEditarDisciplinaCronograma: false,
              funDelete: () {},
              height: size.height,
              width: size.width,
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
