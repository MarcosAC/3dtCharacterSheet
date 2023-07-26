import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCharacterScreen extends StatefulWidget {
  const ListCharacterScreen({super.key});

  @override
  State<ListCharacterScreen> createState() => _ListCharacterScreenState();
}

class _ListCharacterScreenState extends State<ListCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Personagens'),
          titleTextStyle: const TextStyle(fontSize: 17),
          actions: [
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
                              return ListTile(title: Text('Personagen: ${characters.characterByIndex(index).name}'));
                            },
                            separatorBuilder: (BuildContext context, index) => const Divider(),
                            itemCount: characters.itemsCount,
                          ),
                    child: const Center(child: Text('Não existe fichas de persongens!')))));
  }
}
