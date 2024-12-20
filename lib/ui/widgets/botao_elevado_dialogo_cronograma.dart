import 'package:flutter/material.dart';

class BotaoElevadoDialogoCronograma extends StatelessWidget {
  final String title;
  final bool isTurno;
  final void Function() fun;
  const BotaoElevadoDialogoCronograma({
    required this.title,
    required this.isTurno,
    required this.fun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isTurno
            ? Theme.of(context).colorScheme.onSecondaryContainer
            : Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      onPressed: fun,
      child: Text(title),
    );
  }
}
