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
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: const EdgeInsets.only(left: 10, right: 5),
                  title: const Text(
                    'Características',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Força'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_circle),
                            ),
                            const SizedBox(
                              width: 100,
                              height: 35,
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle),
                            ),
                          ],
                        ),
                        Row(
                          children: const [Text('Habilidade')],
                        ),
                        Row(
                          children: const [Text('Resistência')],
                        ),
                        Row(
                          children: const [Text('Armadura')],
                        ),
                        Row(
                          children: const [Text('Poder de Fogo')],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "Tipos de Dano",
                item: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CharacteristicsItem(textItem: "Força", points: 0),
                    CharacteristicsItem(textItem: "Poder de Fogo", points: 0)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "Caminhos da Magia",
                item: Column(
                  children: const [
                    CharacteristicsItem(textItem: "Água", points: 10),
                    CharacteristicsItem(textItem: "Ar", points: 10),
                    CharacteristicsItem(textItem: "Fogo", points: 10),
                    CharacteristicsItem(textItem: "Luz", points: 10),
                    CharacteristicsItem(textItem: "Terra", points: 10),
                    CharacteristicsItem(textItem: "Trevas", points: 10)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "Desvantagens",
                item: Container(),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "Magias Conhecidas",
                item: Container(),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "Dinheiro e Itens",
                item: Container(),
              ),
              const SizedBox(height: 10),
              Characteristics(
                tittle: "História",
                item: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
