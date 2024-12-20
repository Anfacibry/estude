import 'package:estude/utils/data_constante.dart';
import 'package:estude/domain/store/store_state.dart';
import 'package:estude/ui/screens/cronograma.dart';
import 'package:estude/ui/screens/disciplinas.dart';
import 'package:estude/ui/screens/home.dart';
import 'package:estude/ui/screens/perfil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NavigationScreensState extends StatelessWidget {
  const NavigationScreensState({super.key});

  @override
  Widget build(BuildContext context) {
    final indexScreen = Provider.of<StoreState>(context, listen: false);

    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            textAppBar[indexScreen.indexSelectScreen],
          ),
          centerTitle: true,
        ),
        body: <Widget>[
          const Home(),
          const Cronograma(),
          const ScreenDisciplinas(),
          const Perfil(),
        ][indexScreen.indexSelectScreen],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            indexScreen.selectScreen(index);
          },
          selectedIndex: indexScreen.indexSelectScreen,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          destinations: const [
            NavigatorScreenHome(
              image: "assets/icon/home.png",
              label: "Home",
            ),
            NavigatorScreenHome(
              image: "assets/icon/cronograma.png",
              label: "Cronograma",
            ),
            NavigatorScreenHome(
              image: "assets/icon/book.png",
              label: "Disciplinas",
            ),
            NavigatorScreenHome(
              image: "assets/icon/perfil.png",
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorScreenHome extends StatelessWidget {
  final String image;
  final String label;
  const NavigatorScreenHome(
      {super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: LayoutBuilder(
        builder: (context, constraints) => Image.asset(
          image,
          height: constraints.maxHeight * .3,
          color: Colors.white,
        ),
      ),
      label: label,
    );
  }
}
