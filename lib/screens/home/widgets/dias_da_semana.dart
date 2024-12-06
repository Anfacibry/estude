import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/data_constante.dart';
import '../../../utils/theme/app_layout.dart';

class DiasDaSemana extends StatelessWidget {
  final double height, width;
  const DiasDaSemana({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .1,
      width: width,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: width * .04),
          child: Container(
            height: height * .08,
            width: width * .12,
            decoration: BoxDecoration(
                color: index == 0
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  AppLayout.boxShadowPrincipal(context),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${listaDatas[index].day}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const Divider(
                  height: 2,
                  indent: 6,
                  endIndent: 6,
                ),
                Text(
                  DateFormat("E", "pt_BR").format(listaDatas[index]),
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
