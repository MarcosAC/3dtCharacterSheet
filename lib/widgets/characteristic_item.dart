import 'package:flutter/material.dart';

class CharacteristicItem extends StatelessWidget {
  const CharacteristicItem({super.key, required this.textItem});

  final String textItem;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(padding: const EdgeInsets.only(bottom: 3), child: Text(textItem)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle),
          ),
          const SizedBox(
            width: 100,
            height: 35,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
          ),
        ],
      )
    ]);
  }
}
