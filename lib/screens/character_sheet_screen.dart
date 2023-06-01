import 'package:dtcharactersheet/widgets/characteristic_item.dart';
import 'package:dtcharactersheet/widgets/characteristics.dart';
import 'package:flutter/material.dart';

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
            children: const [
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Characteristics(tittle: 'Características', item: [
                CharacteristicItem(textItem: 'Força'),
                CharacteristicItem(textItem: 'Habilidade'),
                CharacteristicItem(textItem: 'Resitência'),
                CharacteristicItem(textItem: 'Armadura'),
                CharacteristicItem(textItem: 'Poder de Fogo')
              ]),
              SizedBox(height: 10),
              Characteristics(tittle: 'Tipos de Dano', item: [
                CharacteristicItem(textItem: 'Força'),
                CharacteristicItem(textItem: 'Poder de Fogo')
              ]),
              SizedBox(height: 10),
              Characteristics(tittle: 'Caminhos da Magia', item: [
                CharacteristicItem(textItem: "Água"),
                CharacteristicItem(textItem: "Ar"),
                CharacteristicItem(textItem: "Fogo"),
                CharacteristicItem(textItem: "Luz"),
                CharacteristicItem(textItem: "Terra"),
                CharacteristicItem(textItem: "Trevas")
              ]),
              SizedBox(height: 10),
              Characteristics(tittle: 'Desvantagens', item: []),
              SizedBox(height: 10),
              Characteristics(tittle: 'Magias Conhecidas', item: []),
              SizedBox(height: 10),
              Characteristics(tittle: 'Dinheiro e Itens', item: []),
              SizedBox(height: 10),
              Characteristics(tittle: 'História', item: []),
            ],
          ),
        ),
      ),
    );
  }
}
