import 'package:estude/screens/disciplinas/widgets/text_form_field_disciplina.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/app_style_text.dart';

class DialogoAddDisciplina extends StatelessWidget {
  final double height, width;
  final String title;
  final TextEditingController controllerDisciplina, controllerProfessor;
  final void Function() funAdd;
  final void Function() funDelete;
  final bool isEditar;
  const DialogoAddDisciplina({
    required this.isEditar,
    required this.height,
    required this.width,
    required this.title,
    required this.controllerDisciplina,
    required this.controllerProfessor,
    required this.funAdd,
    required this.funDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.none,
      title: isEditar
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: AppStyleText.textoOnPrimaryContainer(
                      context: context, size: 24),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: funDelete,
                  icon: const Icon(Icons.delete_rounded),
                  color: Theme.of(context).colorScheme.error,
                )
              ],
            )
          : Text(
              title,
              style: AppStyleText.textoOnPrimaryContainer(
                  context: context, size: 24),
              textAlign: TextAlign.center,
            ),
      content: SizedBox(
        height: height * .2,
        width: width * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardTextFormFieldDisciplina(
              label: "Nome da disciplina",
              textController: controllerDisciplina,
            ),
            CardTextFormFieldDisciplina(
              label: "Nome do(a) Professor(a)",
              textController: controllerProfessor,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: funAdd,
          child: const Text("Salvar"),
        ),
      ],
    );
  }
}
