import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/screens/character_sheet_screen.dart';
import 'package:dtcharactersheet/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCharacterScreen extends StatefulWidget {
  const ListCharacterScreen({super.key});

  @override
  State<ListCharacterScreen> createState() => _ListCharacterScreenState();
}

class _ListCharacterScreenState extends State<ListCharacterScreen> {
  final List<Character> charactersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista de Personagens'), titleTextStyle: const TextStyle(fontSize: 17), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(AppRoutes.characterSheetScreen);
              },
              icon: const Icon(Icons.add)),
          //   IconButton(
          //       onPressed: () {
          //         Provider.of<CharacterProvider>(context, listen: false).loadCharacters();
          //       },
          //       icon: const Icon(Icons.list))
        ]),
        body: FutureBuilder(
            future: Provider.of<CharacterProvider>(context, listen: false).loadCharacters(),
            builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Consumer<CharacterProvider>(
                    builder: (context, characters, child) => characters.itemsCount == 0
                        ? child!
                        : ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: ListTile(
                                      leading: const CircleAvatar(child: Text('P')),
                                      title: Text('Personagen: ${characters.characterByIndex(index).name}'),
                                      subtitle: Text(
                                          'Pontos de Vida: ${characters.characterByIndex(index).healthPoints}\nXP: ${characters.characterByIndex(index).experience}'),
                                      trailing: IconButton(
                                          onPressed: () {
                                            characters.delete(characters.characterByIndex(index).id!);
                                          },
                                          icon: const Icon(Icons.delete_forever_outlined, color: Colors.black)),
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) => CharacterSheetScreen(character: characters.characterByIndex(index)))));
                                      }));
                            },
                            itemCount: characters.itemsCount,
                          ),
                    child: const Center(child: Text('Não existe fichas de persongens!')))));
  }
}
