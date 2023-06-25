import 'package:flutter/material.dart';

class MultLineTextField extends StatefulWidget {
  const MultLineTextField({super.key, this.textController});

  final TextEditingController? textController;

  @override
  State<MultLineTextField> createState() => _MultLineTextFieldState();
}

class _MultLineTextFieldState extends State<MultLineTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.textController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        maxLines: null);
  }
}
