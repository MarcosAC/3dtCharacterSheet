import 'package:flutter/material.dart';

class CharacterSheetScreen extends StatefulWidget {
  const CharacterSheetScreen({super.key});

  @override
  State<CharacterSheetScreen> createState() => _CharacterSheetScreenState();
}

class _CharacterSheetScreenState extends State<CharacterSheetScreen> {
  late final List<Widget> _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ficha do Personagem - 3D&T")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nome",
                //labelStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Características",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_more))
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Força"),
                            Text("Habilidade"),
                            Text("Resistência"),
                            Text("Armadura"),
                            Text("Poder de Fogo"),
                            Text("Pontos de Vida"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
