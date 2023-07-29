import 'package:flutter/material.dart';

class CharacteristicItem extends StatefulWidget {
  const CharacteristicItem({super.key, required this.textItem, required this.itemTextController});

  final String textItem;
  final TextEditingController? itemTextController;

  @override
  State<CharacteristicItem> createState() => _CharacteristicItemState();
}

class _CharacteristicItemState extends State<CharacteristicItem> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: const EdgeInsets.only(bottom: 3), child: Text(widget.textItem)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _decrementCounter();
              },
              icon: const Icon(Icons.remove_circle, color: Colors.red),
            ),
            SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: widget.itemTextController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (widget.itemTextController!.text.isEmpty) {
                    _counter = int.parse(widget.itemTextController!.text = '0');
                  } else {
                    _counter = int.parse(value);
                  }
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _incrementCounter();
              },
              icon: const Icon(Icons.add_circle, color: Colors.blue),
            ),
          ],
        )
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      if (widget.itemTextController!.text.isNotEmpty) {
        _counter = int.parse(widget.itemTextController!.text);
        _counter++;
        widget.itemTextController!.text = '$_counter';
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.itemTextController!.text.isNotEmpty) {
        _counter = int.parse(widget.itemTextController!.text);
        if (_counter > 0) {
          _counter--;
          widget.itemTextController!.text = '$_counter';
        }
      }
    });
  }
}
