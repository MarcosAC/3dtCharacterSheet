import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCharacterScreen extends StatefulWidget {
  const ListCharacterScreen({super.key});

  @override
  State<ListCharacterScreen> createState() => _ListCharacterScreenState();
}

class _ListCharacterScreenState extends State<ListCharacterScreen> {
  //final List<Character> characters = Provider.of<CharacterProvider>(context, listen: false).loadCharacters();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Personagens'),
          titleTextStyle: const TextStyle(fontSize: 17),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<CharacterProvider>(context, listen: false).loadCharacters();
                },
                icon: const Icon(Icons.list))
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<CharacterProvider>(context, listen: false).loadCharacters(),
            builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Consumer<CharacterProvider>(
                    builder: (context, characters, child) => characters.itemsCount == 0
                        ? child!
                        : ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                child: Center(child: Text('Personagem ${characters.itemsCount}')),
                              );
                            },
                            separatorBuilder: (BuildContext context, index) => const Divider(),
                            itemCount: characters.itemsCount,
                          ),
                    child: const Center(child: Text('Não existe fichas de persongens!')))));
  }
}
