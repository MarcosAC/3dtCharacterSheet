import 'package:flutter/material.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  bool isOnTap = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
          padding: const EdgeInsets.only(left: 3),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  isOnTap = !isOnTap;
                });
              },
              child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: isOnTap ? Colors.black : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.black),
                      shape: BoxShape.circle))))
    ]);
  }
}
