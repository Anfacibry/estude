import 'package:estude/data/services/obtendo_dados.dart';
import 'package:estude/utils/data_constante.dart';
import 'package:estude/data/repositories/db_disciplina.dart';
import 'package:estude/data/model/disciplina.dart';
import 'package:estude/utils/responsividade.dart';
import 'package:flutter/material.dart';

import '../widgets/dialogo_add_disciplina.dart';

class ScreenDisciplinas extends StatefulWidget {
  const ScreenDisciplinas({super.key});

  @override
  State<ScreenDisciplinas> createState() => _ScreenDisciplinasState();
}

class _ScreenDisciplinasState extends State<ScreenDisciplinas> {
  @override
  Widget build(BuildContext context) {
    listaFiltrada();
    final ({double height, double width}) size =
        AppResponsiv.sizeLayout(context);
    TextEditingController textEditingControllerDisciplina =
        TextEditingController();
    TextEditingController textEditingControllerProfessor =
        TextEditingController();

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: FutureBuilder<List<Disciplina>>(
          future: listaDisciplinas(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                List<Disciplina> listaDisciplina = snapshot.data!;
                return listaDisciplina.isNotEmpty
                    ? ListView.builder(
                        itemCount: listaDisciplina.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            final TextEditingController disciplina =
                                TextEditingController(
                                    text:
                                        listaDisciplina[index].nomeDisciplina);
                            final TextEditingController professor =
                                TextEditingController(
                                    text: listaDisciplina[index].professor);
                            showDialog(
                              context: context,
                              builder: (context) => DialogoAddDisciplina(
                                isEditar: true,
                                title: "Editar disciplina",
                                height: size.height,
                                width: size.width,
                                controllerDisciplina: disciplina,
                                controllerProfessor: professor,
                                funAdd: () {
                                  setState(() {
                                    atualizandoDisciplina(Disciplina(
                                      idDisciplina:
                                          listaDisciplina[index].idDisciplina,
                                      nomeDisciplina: disciplina.text,
                                      professor: professor.text,
                                    ));
                                  });
                                  Navigator.pop(context);
                                },
                                funDelete: () {
                                  setState(() {
                                    deletarDisciplina(listaDisciplina[index]);
                                  });

                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Container(
                              height: size.height * .07,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                titleTextStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                subtitleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                                title:
                                    Text(listaDisciplina[index].nomeDisciplina),
                                subtitle:
                                    Text(listaDisciplina[index].professor),
                              ),
                            ),
                          ),
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
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DialogoAddDisciplina(
              isEditar: false,
              title: "Adicionar disciplina",
              height: size.height,
              width: size.width,
              controllerDisciplina: textEditingControllerDisciplina,
              controllerProfessor: textEditingControllerProfessor,
              funAdd: () {
                setState(() {
                  insertDisciplina(Disciplina(
                    idDisciplina: uuid.v8(),
                    nomeDisciplina: textEditingControllerDisciplina.text,
                    professor: textEditingControllerProfessor.text,
                  ));
                });

                Navigator.pop(context);
              },
              funDelete: () {},
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
