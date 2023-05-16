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

              // Características
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
                    "Características",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Força"),
                        SizedBox(height: 3),
                        Text("Habilidade"),
                        SizedBox(height: 3),
                        Text("Resistência"),
                        SizedBox(height: 3),
                        Text("Armadura"),
                        SizedBox(height: 3),
                        //Divider(height: 1, color: Colors.black),
                        SizedBox(height: 10),
                        Text("Poder de Fogo"),
                        //SizedBox(height: 5),
                        //Divider(height: 1, color: Colors.black),
                        SizedBox(height: 10),
                        Text("Pontos de Vida"),
                        SizedBox(height: 10),
                        Text("Expêrincia"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Tipos de Dano
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
                    "Tipos de Dano",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Força"),
                        SizedBox(height: 3),
                        Text("Poder de Fogo"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Caminhos da Magia
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
                    "Caminhos da Magia",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Água"),
                        SizedBox(height: 3),
                        Text("Ar"),
                        SizedBox(height: 3),
                        Text("Fogo"),
                        SizedBox(height: 3),
                        Text("Luz"),
                        SizedBox(height: 3),
                        Text("Terra"),
                        SizedBox(height: 3),
                        Text("Trevas"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Vantagens
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    "Vantagens",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [],
                ),
              ),

              const SizedBox(height: 10),

              // Desvantagens
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    "Desvantagens",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [],
                ),
              ),

              const SizedBox(height: 10),

              // Magias Conhecidas
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    "Magias Conhecidas",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [],
                ),
              ),

              const SizedBox(height: 10),

              // Dinheiro e Itens
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    "Dinheiro e Itens",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [],
                ),
              ),

              const SizedBox(height: 10),

              // História
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: EdgeInsets.only(left: 10, right: 5),
                  title: Text(
                    "História",
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
