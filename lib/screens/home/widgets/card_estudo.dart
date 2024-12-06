import 'package:estude/store/store_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsividade.dart';
import '../../../utils/theme/app_layout.dart';

class CardEstudo extends StatelessWidget {
  const CardEstudo({super.key});

  @override
  Widget build(BuildContext context) {
    final ({double height, double width}) size =
        AppResponsiv.sizeLayout(context);
    final storeState = Provider.of<StoreState>(context, listen: false);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: size.height * .3,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            AppLayout.boxShadowPrincipal(context),
          ]),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * .01,
                  right: size.width * .02,
                  left: size.width * .02,
                  bottom: size.height * .01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Nome da disciplina",
                      style: TextStyle(
                          fontSize: constraints.maxHeight * .08,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ),
                    Observer(
                        builder: (context) => IconButton(
                              padding: const EdgeInsets.all(0),
                              style: ButtonStyle(
                                fixedSize: WidgetStatePropertyAll(Size(
                                    constraints.minHeight * .14,
                                    constraints.minHeight * .14)),
                                iconSize: WidgetStatePropertyAll(
                                    constraints.minHeight * .14),
                              ),
                              onPressed: () {
                                storeState.concluirEstudo();
                              },
                              icon: storeState.isEstudoConcluido
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                    )
                                  : Icon(
                                      Icons.check_circle_outline,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                            )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/estudo-menino.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Observer(
                builder: (context) => Container(
                  color: storeState.isEstudoConcluido
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.none,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (context) => IconButton(
                          onPressed: () {
                            storeState.paly();
                          },
                          padding: const EdgeInsets.all(0),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.onPrimary,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              storeState.isEstudoConcluido
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                            ),
                          ),
                          icon: storeState.isPlay
                              ? Icon(
                                  Icons.pause_circle,
                                  size: constraints.maxHeight * .15,
                                )
                              : Icon(
                                  Icons.play_circle_fill_rounded,
                                  size: constraints.maxHeight * .15,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tempo restante",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          Text(
                            "00:30 min.",
                            style: TextStyle(
                              fontSize: constraints.minHeight * .08,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: constraints.maxHeight * .15,
                        width: constraints.maxWidth * .01,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tempo total",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          Text(
                            "02h e 30 min.",
                            style: TextStyle(
                              fontSize: constraints.minHeight * .08,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
