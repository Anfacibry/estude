import 'package:flutter/material.dart';

class AppStyleText {
  static TextStyle textoOnPrimaryContainer(
          {required BuildContext context, double size = 16}) =>
      TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      );
  static TextStyle textoPrimaryContainer(
          {required BuildContext context, double size = 16}) =>
      TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.primaryContainer,
      );
  static TextStyle textoOnPrimary(
          {required BuildContext context, double size = 16}) =>
      TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.onPrimary,
      );

  static TextStyle textoOnSecundaryContainer(
          {required BuildContext context, double size = 16}) =>
      TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      );
}
