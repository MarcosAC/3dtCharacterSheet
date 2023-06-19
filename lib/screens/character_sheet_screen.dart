import 'package:dtcharactersheet/widgets/characteristic_item.dart';
import 'package:dtcharactersheet/widgets/characteristics.dart';
import 'package:dtcharactersheet/widgets/mult_line_text_field.dart';
import 'package:dtcharactersheet/widgets/text_field_custom.dart';
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
                  padding: EdgeInsets.all(10),
                  child: TextFieldCustom(label: 'Nome'),
                ),
              ),
              SizedBox(height: 10),

              // Características
              Characteristics(tittle: 'Características', item: [
                CharacteristicItem(textItem: 'Força'),
                CharacteristicItem(textItem: 'Habilidade'),
                CharacteristicItem(textItem: 'Resitência'),
                CharacteristicItem(textItem: 'Armadura'),
                CharacteristicItem(textItem: 'Poder de Fogo')
              ]),
              SizedBox(height: 10),

              // Tipos de Dano

              Characteristics(tittle: 'Tipos de Dano', item: [
                SizedBox(height: 5),
                TextFieldCustom(label: 'Força'),
                SizedBox(height: 10),
                TextFieldCustom(label: 'Poder de Fogo')
              ]),
              SizedBox(height: 10),

              // Caminhos da Magia
              Characteristics(tittle: 'Caminhos da Magia', item: [
                CharacteristicItem(textItem: "Água"),
                CharacteristicItem(textItem: "Ar"),
                CharacteristicItem(textItem: "Fogo"),
                CharacteristicItem(textItem: "Luz"),
                CharacteristicItem(textItem: "Terra"),
                CharacteristicItem(textItem: "Trevas")
              ]),
              SizedBox(height: 10),

              // Vantagens
              Characteristics(tittle: 'Vantagens', item: [MultLineTextField()]),
              SizedBox(height: 10),

              // Desvantagens
              Characteristics(
                tittle: 'Desvantagens',
                item: [MultLineTextField()],
              ),
              SizedBox(height: 10),

              // Magias Conhecidas
              Characteristics(
                tittle: 'Magias Conhecidas',
                item: [MultLineTextField()],
              ),
              SizedBox(height: 10),

              // Dinheiro e Itens
              Characteristics(
                tittle: 'Dinheiro e Itens',
                item: [MultLineTextField()],
              ),
              SizedBox(height: 10),

              // História
              Characteristics(
                tittle: 'História',
                item: [MultLineTextField()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
