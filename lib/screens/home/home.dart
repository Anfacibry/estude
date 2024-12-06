import 'package:estude/screens/home/widgets/card_estudo.dart';
import 'package:estude/screens/home/widgets/dias_da_semana.dart';
import 'package:estude/store/store_lista_estudo_cronograma.dart';
import 'package:estude/utils/responsividade.dart';
import 'package:estude/utils/theme/app_layout.dart';

import 'package:estude/utils/theme/app_style_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ({double height, double width}) size =
        AppResponsiv.sizeLayout(context);
    final StoreListaEstudoCronograma lista =
        Provider.of<StoreListaEstudoCronograma>(context, listen: false);
    final int media =
        lista.manha.length + lista.tarde.length + lista.noite.length;
    debugPrint(media.toStringAsFixed(2));
    return SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            right: size.width * .04,
            left: size.width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * .02,
                ),
                child: const CardEstudo(),
              ),
              AppResponsiv.paddingTop(size.height * .01),
              Text(
                "Dias da semana",
                style: TextStyle(
                  fontSize: size.width * .05,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              DiasDaSemana(height: size.height, width: size.width),
              AppResponsiv.paddingTop(size.height * .01),
              Text(
                "Desempenho",
                style: TextStyle(
                  fontSize: size.width * .05,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              Container(
                height: size.height * .17,
                width: size.width,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(size.height * .02),
                    boxShadow: [
                      AppLayout.boxShadowPrincipal(context),
                    ]),
                child: LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxHeight * .05,
                      bottom: constraints.maxHeight * .05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth * .5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total de horas",
                                style: AppStyleText.textoOnPrimaryContainer(
                                    size: constraints.maxHeight * .12,
                                    context: context),
                              ),
                              Text(
                                "10h e 30 min.",
                                style: AppStyleText.textoPrimaryContainer(
                                  context: context,
                                  size: constraints.maxHeight * .17,
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                "Horas estudadas",
                                style: AppStyleText.textoOnPrimaryContainer(
                                    size: constraints.maxHeight * .12,
                                    context: context),
                              ),
                              Text(
                                "07h e 30 min.",
                                style: AppStyleText.textoOnSecundaryContainer(
                                  context: context,
                                  size: constraints.maxHeight * .17,
                                ),
                              )
                            ],
                          ),
                        ),

                        ///Padding do circular progress
                        Padding(
                          padding: EdgeInsets.only(
                            right: constraints.maxWidth * .1,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: AlignmentDirectional.center,
                            children: [
                              CircularProgressIndicator(
                                strokeCap: StrokeCap.round,
                                strokeWidth: constraints.maxHeight * .1,
                                strokeAlign: constraints.maxHeight * .035,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                value: 0.70,
                              ),
                              Positioned(
                                bottom: constraints.maxHeight * .03,
                                child: Text(
                                  "70%",
                                  style: AppStyleText.textoOnPrimaryContainer(
                                    size: constraints.maxHeight * .25,
                                    context: context,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: constraints.maxHeight * .15,
                                child: Text(
                                  "Aproveitamento",
                                  style: AppStyleText.textoOnPrimaryContainer(
                                    size: constraints.maxHeight * .07,
                                    context: context,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppResponsiv.paddingTop(size.height * .01),
              Text(
                "Disciplinas",
                style: TextStyle(
                  fontSize: size.width * .05,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              Container(
                height: AppResponsiv.cardDisciplinasResponsive(
                    height: size.height, totalDisciplinasSemada: media),
                width: size.width,
                padding: EdgeInsets.all(size.width * .04),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(size.height * .02),
                    boxShadow: [
                      AppLayout.boxShadowPrincipal(context),
                    ]),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // CardDiciplinasTurnos(
                    //   disciplinas: manha,
                    //   turno: "Manhã",
                    //   height: height,
                    //   width: width,
                    // ),
                    // CardDiciplinasTurnos(
                    //   disciplinas: tarde,
                    //   turno: "Tarde",
                    //   height: height,
                    //   width: width,
                    // ),
                    // CardDiciplinasTurnos(
                    //   disciplinas: noite,
                    //   turno: "Noite",
                    //   height: height,
                    //   width: width,
                    // ),
                  ],
                ),
              ),
              AppResponsiv.paddingTop(size.height * .01),
            ],
          ),
        ));
  }
}
