import 'package:dtcharactersheet/widgets/points.dart';
import 'package:flutter/material.dart';

class CharacteristicsItem extends StatelessWidget {
  const CharacteristicsItem(
      {super.key, required this.textItem, required this.points});

  final String textItem;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(padding: const EdgeInsets.only(bottom: 3), child: Text(textItem)),
      Row(children: List<Widget>.generate(points, ((index) => const Points())))
    ]);
  }
}
