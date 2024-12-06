import 'package:flutter/material.dart';

class AppResponsiv {
  static ({double height, double width}) sizeLayout(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return (height: height, width: width);
  }

  static Padding paddingTop(double height) =>
      Padding(padding: EdgeInsets.only(top: height));

  static double cardDisciplinasResponsive(
      {required double height, required int totalDisciplinasSemada}) {
    if (totalDisciplinasSemada >= 0 && totalDisciplinasSemada <= 3) {
      return height * .4;
    } else if (totalDisciplinasSemada >= 4 && totalDisciplinasSemada <= 5) {
      return height * (.1 * (totalDisciplinasSemada + 0.5));
    } else if (totalDisciplinasSemada >= 6 && totalDisciplinasSemada <= 7) {
      return height * (.1 * (totalDisciplinasSemada));
    } else if (totalDisciplinasSemada >= 8 && totalDisciplinasSemada <= 9) {
      return height * (.1 * ((totalDisciplinasSemada - 1) + 0.5));
    } else if (totalDisciplinasSemada >= 10 && totalDisciplinasSemada <= 12) {
      return height * (.1 * (totalDisciplinasSemada - 1));
    } else if (totalDisciplinasSemada >= 13 && totalDisciplinasSemada <= 15) {
      return height * (.1 * (totalDisciplinasSemada - 2));
    } else {
      return height * (.1 * (totalDisciplinasSemada - 3));
    }
  }
}
