import 'package:estude/model/estudo_disciplina.dart';
import 'package:estude/screens/cronograma/widgets/alerta_dialogo_cronograma.dart';

import 'package:estude/store/store_state.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/theme/app_layout.dart';
import '../utils/theme/app_style_text.dart';

class CardDiciplinasTurnos extends StatefulWidget {
  final double height, width;
  final String turno;
  final List<EstudoDisciplina> estudoDisciplinas;

  final bool isEditar;
  final void Function() funDeletar, fun;

  const CardDiciplinasTurnos({
    required this.isEditar,
    required this.estudoDisciplinas,
    required this.turno,
    required this.height,
    required this.width,
    required this.funDeletar,
    required this.fun,
    super.key,
  });

  @override
  State<CardDiciplinasTurnos> createState() => _CardDiciplinasTurnosState();
}

class _CardDiciplinasTurnosState extends State<CardDiciplinasTurnos> {
  @override
  Widget build(BuildContext context) {
    final StoreState storeState = Provider.of(context, listen: false);

    return SizedBox(
      height: (widget.height - widget.height * .3) *
          (.1 * widget.estudoDisciplinas.length),
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: widget.height * .015,
              left: widget.width * .02,
              right: widget.width * .02,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(
                  widget.height * .02,
                ),
                boxShadow: [
                  AppLayout.boxShadowPrincipal(context),
                ]),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < widget.estudoDisciplinas.length; i++)
                    InkWell(
                      onTap: () {
                        storeState.selecionandoIdDisciplina(
                            widget.estudoDisciplinas[i].idDisciplina);
                        storeState.selecionandoHoras(
                            widget.estudoDisciplinas[i].tempoHoras);
                        storeState.selecionandoMinutos(
                            widget.estudoDisciplinas[i].tempMinutos);
                        storeState
                            .escolhendoTurno(widget.estudoDisciplinas[i].turno);
                        storeState.pegandoId(widget.estudoDisciplinas[i].id);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialogCronograma(
                            estudoDisciplina: widget.estudoDisciplinas[i],
                            isEditarDisciplinaCronograma: widget.isEditar,
                            funDelete: widget.funDeletar,
                            height: widget.height,
                            width: widget.width,
                            fun: widget.fun,
                          ),
                        );
                      },
                      child: CardDisciplinaPega(
                        disciplina: "En análise",
                        isEstudando: false,
                        horasMinutos:
                            "${widget.estudoDisciplinas[i].tempoHoras}h${widget.estudoDisciplinas[i].tempMinutos == 0 ? "" : widget.estudoDisciplinas[i].tempMinutos}",
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -25,
            left: widget.width * .03,
            child: Container(
              height: widget.height * .042,
              width: widget.width * .4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(widget.width * .02),
                  boxShadow: [
                    AppLayout.boxShadowPrincipal(context),
                  ]),
              child: Text(
                widget.turno,
                style: AppStyleText.textoOnPrimary(
                  context: context,
                  size: widget.height * .03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardDisciplinaPega extends StatelessWidget {
  final double width, height;
  final String disciplina;
  final String horasMinutos;
  final bool isEstudando;
  const CardDisciplinaPega({
    required this.disciplina,
    required this.horasMinutos,
    required this.isEstudando,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: width * .12,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(width * .03),
            boxShadow: [
              AppLayout.boxShadowPrincipal(context),
            ]),
        child: Padding(
          padding: EdgeInsets.only(
            right: width * .02,
            left: width * .02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                disciplina,
                style: AppStyleText.textoOnPrimary(context: context),
              ),
              Container(
                height: width * .08,
                width: width * .19,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(
                      width * .02,
                    )),
                child: isEstudando
                    ? Icon(
                        Icons.schedule_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    : Text(
                        horasMinutos,
                        style: AppStyleText.textoOnPrimary(context: context),
                      ),
              ),
            ],
          ),
        ));
  }
}
