import 'package:estude/screens/navegation_screens.dart/navigation_screens.dart';
import 'package:estude/store/store_lista_estudo_cronograma.dart';
import 'package:estude/store/store_state.dart';
import 'package:estude/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => StoreState()),
      Provider(create: (context) => StoreListaEstudoCronograma())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: AppColor.onPrimaryColor,
          ),
          useMaterial3: true,
          colorScheme: AppColor.schemeColorApp,
          fontFamily: "Poetsen",
          textTheme: TextTheme(
              bodyMedium: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ))),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      home: const NavigationScreensState(),
    );
  }
}
