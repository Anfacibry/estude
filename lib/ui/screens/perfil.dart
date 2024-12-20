import 'package:estude/utils/responsividade.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final ({double height, double width}) size =
        AppResponsiv.sizeLayout(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: const Center(
        child: Text("Tela de Perfil"),
      ),
    );
  }
}
