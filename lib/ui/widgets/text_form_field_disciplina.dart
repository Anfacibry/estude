import 'package:estude/utils/theme/app_color.dart';
import 'package:estude/utils/theme/app_layout.dart';
import 'package:flutter/material.dart';

class CardTextFormFieldDisciplina extends StatelessWidget {
  final String label;
  final TextEditingController textController;
  const CardTextFormFieldDisciplina({
    required this.label,
    required this.textController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(boxShadow: [AppLayout.boxShadowPrincipal(context)]),
      child: TextFormField(
        controller: textController,
        style: const TextStyle(color: AppColor.textFormeField),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
          labelStyle: const TextStyle(color: AppColor.textFormeField),
          label: Text(
            label,
          ),
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
