import 'package:flutter/material.dart';

class AppLayout {
  static BoxShadow boxShadowPrincipal(BuildContext context) => BoxShadow(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        offset: const Offset(0, 5),
        blurRadius: 5,
        blurStyle: BlurStyle.normal,
      );
}
