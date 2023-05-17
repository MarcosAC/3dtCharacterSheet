import 'package:flutter/material.dart';

class CharacteristicsItem extends StatelessWidget {
  const CharacteristicsItem({super.key, required this.textItem});

  final String textItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(textItem),
        const SizedBox(height: 3),
      ],
    );
  }
}
