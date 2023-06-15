import 'package:flutter/material.dart';

class CharacteristicItem extends StatefulWidget {
  const CharacteristicItem({super.key, required this.textItem});

  final String textItem;

  @override
  State<CharacteristicItem> createState() => _CharacteristicItemState();
}

class _CharacteristicItemState extends State<CharacteristicItem> {
  final _itemTextController = TextEditingController();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _itemTextController.text = '$_counter';
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
              controller: _itemTextController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (_itemTextController.text.isEmpty) {
                  _counter = int.tryParse(_itemTextController.text = '0')!;
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
      _itemTextController.text = '$_counter';
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _itemTextController.text = '$_counter';
    });
  }
}