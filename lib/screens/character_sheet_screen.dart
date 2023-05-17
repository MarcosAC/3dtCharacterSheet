import 'package:dtcharactersheet/widgets/characteristics.dart';
import 'package:dtcharactersheet/widgets/characteristics_item.dart';
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
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Características",
                items: [
                  CharacteristicsItem(textItem: "Força"),
                  CharacteristicsItem(textItem: "Habilidade"),
                  CharacteristicsItem(textItem: "Resistência"),
                  CharacteristicsItem(textItem: "Armadura"),
                  CharacteristicsItem(textItem: "Poder de Fogo"),
                  SizedBox(height: 10),
                  CharacteristicsItem(textItem: "Pontos de Vida"),
                  CharacteristicsItem(textItem: "Expêrincia")
                ],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Tipos de Dano",
                items: [
                  CharacteristicsItem(textItem: "Força"),
                  CharacteristicsItem(textItem: "Poder de Fogo")
                ],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Caminhos da Magia",
                items: [
                  CharacteristicsItem(textItem: "Água"),
                  CharacteristicsItem(textItem: "Ar"),
                  CharacteristicsItem(textItem: "Fogo"),
                  CharacteristicsItem(textItem: "Luz"),
                  CharacteristicsItem(textItem: "Terra"),
                  CharacteristicsItem(textItem: "Trevas")
                ],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Desvantagens",
                items: [],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Magias Conhecidas",
                items: [],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "Dinheiro e Itens",
                items: [],
              ),
              const SizedBox(height: 10),
              const Characteristics(
                tittle: "História",
                items: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
