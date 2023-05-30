import 'package:dtcharactersheet/widgets/characteristic_item.dart';
import 'package:flutter/material.dart';

import '../widgets/characteristics.dart';

class CharacterSheetScreen extends StatefulWidget {
  const CharacterSheetScreen({super.key});

  @override
  State<CharacterSheetScreen> createState() => _CharacterSheetScreenState();
}

class _CharacterSheetScreenState extends State<CharacterSheetScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ficha do Personagem - 3D&T"),
        titleTextStyle: const TextStyle(fontSize: 17),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Características', item: [
                CharacteristicItem(textItem: 'Força'),
                CharacteristicItem(textItem: 'Habilidade'),
                CharacteristicItem(textItem: 'Resitência'),
                CharacteristicItem(textItem: 'Armadura'),
                CharacteristicItem(textItem: 'Poder de Fogo')
              ]),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Tipos de Dano', item: [
                CharacteristicItem(textItem: 'Força'),
                CharacteristicItem(textItem: 'Poder de Fogo')
              ]),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Caminhos da Magia', item: [
                CharacteristicItem(textItem: "Água"),
                CharacteristicItem(textItem: "Ar"),
                CharacteristicItem(textItem: "Fogo"),
                CharacteristicItem(textItem: "Luz"),
                CharacteristicItem(textItem: "Terra"),
                CharacteristicItem(textItem: "Trevas")
              ]),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Desvantagens', item: []),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Magias Conhecidas', item: []),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'Dinheiro e Itens', item: []),
              const SizedBox(height: 10),
              const Characteristics(tittle: 'História', item: []),
            ],
          ),
        ),
      ),
    );
  }
}
