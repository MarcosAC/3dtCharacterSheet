import 'package:flutter/material.dart';

class Characteristics extends StatelessWidget {
  const Characteristics({super.key, required this.tittle, this.items});

  final String tittle;
  final List<Widget>? items;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ExpansionTile(
        expandedAlignment: Alignment.topLeft,
        childrenPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        tilePadding: const EdgeInsets.only(left: 10, right: 5),
        title: Text(
          tittle,
          style: const TextStyle(fontSize: 18),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items!.map((e) => e).toList(),
          ),
        ],
      ),
    );
  }
}
