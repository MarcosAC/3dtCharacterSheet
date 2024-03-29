import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/screens/character_sheet_screen.dart';
import 'package:dtcharactersheet/utils/routes/app_routes.dart';
import 'package:dtcharactersheet/widgets/display_banner_ad.dart';
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
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: FutureBuilder(
                future: Provider.of<CharacterProvider>(context, listen: false).loadCharacters(),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer<CharacterProvider>(
                        builder: (context, characters, child) => characters.itemsCount == 0
                            ? child!
                            : ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                          leading: const CircleAvatar(child: Text('P')),
                                          title: Text('Personagen: ${characters.characterByIndex(index).name}'),
                                          subtitle: Text(
                                              'Pontos de Vida: ${characters.characterByIndex(index).healthPoints}\nXP: ${characters.characterByIndex(index).experience}'),
                                          trailing: IconButton(
                                              onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (BuildContext contex) => AlertDialog(
                                                          title: const Text('Excluir Personagem'),
                                                          content: const Text('Deseja mesmo excluir Personagem?'),
                                                          actions: [
                                                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                                                            TextButton(
                                                                onPressed: () {
                                                                  try {
                                                                    characters.delete(characters.characterByIndex(index).id!);
                                                                    Navigator.pop(context);
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (BuildContext context) => AlertDialog(
                                                                                title: const Text('Sucesso! :D'),
                                                                                content: const Text('Personagem deletado com sucesso. :)'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                      onPressed: () => Navigator.pop(context),
                                                                                      child: const Text('Ok')),
                                                                                ]));
                                                                  } catch (e) {
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (BuildContext context) => AlertDialog(
                                                                                title: const Text('Erro! :X'),
                                                                                content: const Text('Erro ao deletar personagem. :('),
                                                                                actions: [
                                                                                  TextButton(
                                                                                      onPressed: () => Navigator.pop(context),
                                                                                      child: const Text('Ok')),
                                                                                ]));
                                                                  }
                                                                },
                                                                child: const Text('Ok'))
                                                          ])),
                                              icon: const Icon(Icons.delete_forever_outlined, color: Colors.black)),
                                          onTap: () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) => CharacterSheetScreen(character: characters.characterByIndex(index)))))));
                                },
                                itemCount: characters.itemsCount,
                              ),
                        child: const Center(child: Text('Não existe fichas de persongens!')))),
          ),
          const Expanded(flex: 1, child: DisplayBannerAd()),
        ],
      ),
    );
  }
}
