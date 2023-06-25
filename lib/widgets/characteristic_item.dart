import 'package:flutter/material.dart';

class CharacteristicItem extends StatefulWidget {
  CharacteristicItem({
    super.key,
    required this.textItem,
    required TextEditingController itemTextController,
  });

  final String textItem;
  final TextEditingController itemTextController = TextEditingController();

  @override
  State<CharacteristicItem> createState() => _CharacteristicItemState();
}

class _CharacteristicItemState extends State<CharacteristicItem> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.itemTextController.text = '$_counter';
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(widget.textItem)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_counter > 0) _decrementCounter();
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
                if (widget.itemTextController.text.isEmpty) {
                  _counter =
                      int.tryParse(widget.itemTextController.text = '0')!;
                }
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
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
    ]);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.itemTextController.text = '$_counter';
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      widget.itemTextController.text = '$_counter';
    });
  }
}
