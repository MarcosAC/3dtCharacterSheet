import 'package:flutter/material.dart';

class Characteristics extends StatelessWidget {
  const Characteristics({super.key, required this.tittle, required this.item});

  final String tittle;
  final List<Widget> item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          childrenPadding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          tilePadding: const EdgeInsets.only(left: 10, right: 5),
          title: Text(tittle, style: const TextStyle(fontSize: 18)),
          children: item),
    );
  }
}
