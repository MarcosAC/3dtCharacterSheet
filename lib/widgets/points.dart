import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  const Points({super.key, required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List<Widget>.generate(
      quantity,
      (index) => Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            shape: BoxShape.circle,
          ),
        ),
      ),
    ));
  }
}
