import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/models/character_traits.dart';
import 'package:dtcharactersheet/models/damage_types.dart';
import 'package:dtcharactersheet/models/ways_of_magic.dart';
import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/widgets/characteristic_item.dart';
import 'package:dtcharactersheet/widgets/characteristics.dart';
import 'package:dtcharactersheet/widgets/mult_line_text_field.dart';
import 'package:dtcharactersheet/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterSheetScreen extends StatefulWidget {
  const CharacterSheetScreen({super.key});

  @override
  State<CharacterSheetScreen> createState() => _CharacterSheetScreenState();
}

class _CharacterSheetScreenState extends State<CharacterSheetScreen> {
  bool isVisible = false;

  final _nomeController = TextEditingController();
  final _forceController = TextEditingController();
  final _abilityController = TextEditingController();
  final _resistanceController = TextEditingController();
  final _armorController = TextEditingController();
  final _firePowersController = TextEditingController();
  final _experienciaController = TextEditingController();
  final _pontosDeVidaController = TextEditingController();
  final _pontoDeMagiaController = TextEditingController();
  final _vantagemController = TextEditingController();
  final _desvantagemController = TextEditingController();
  final _magiasController = TextEditingController();
  final _dinheiroItemsController = TextEditingController();
  final _historiaController = TextEditingController();
  final _waterController = TextEditingController();
  final _airController = TextEditingController();
  final _fireController = TextEditingController();
  final _lightController = TextEditingController();
  final _earthController = TextEditingController();
  final _darknessController = TextEditingController();
  final _forceDamageController = TextEditingController();
  final _firePowerDamageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ficha do Personagem - 3D&T"),
        titleTextStyle: const TextStyle(fontSize: 17),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<CharacterProvider>(context, listen: false)
                    .loadCharacters();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Character character = Character(
                  name: _nomeController.text,
                  advantage: _vantagemController.text,
                  disadvantage: _desvantagemController.text,
                  spells: _magiasController.text,
                  moneyItems: _dinheiroItemsController.text,
                  history: _historiaController.text,
                  healthPoints: int.parse(_pontosDeVidaController.text),
                  experience: int.parse(_experienciaController.text),
                  magicPoints: int.parse(_pontoDeMagiaController.text),
                  characteristics: CharacterTraits(
                    ability: int.parse(_abilityController.text),
                    armor: int.parse(_armorController.text),
                    firePower: int.parse(_firePowersController.text),
                    force: int.parse(_forceController.text),
                    resistance: int.parse(_resistanceController.text),
                  ),
                  waysOfMagic: WaysOfMagic(
                    water: int.parse(_waterController.text),
                    air: int.parse(_airController.text),
                    fire: int.parse(_fireController.text),
                    light: int.parse(_lightController.text),
                    earth: int.parse(_earthController.text),
                    darkness: int.parse(_darknessController.text),
                  ),
                  damageTypes: DamageTypes(
                    force: _forceDamageController.text,
                    firePower: _firePowerDamageController.text,
                  ),
                );
                Provider.of<CharacterProvider>(context, listen: false)
                    .addCharacter(character);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFieldCustom(
                    label: 'Nome',
                    textController: _nomeController,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Características
              Characteristics(tittle: 'Características', item: [
                CharacteristicItem(
                  textItem: 'Força',
                  itemTextController: _forceController,
                ),
                CharacteristicItem(
                  textItem: 'Habilidade',
                  itemTextController: _abilityController,
                ),
                CharacteristicItem(
                  textItem: 'Resitência',
                  itemTextController: _resistanceController,
                ),
                CharacteristicItem(
                  textItem: 'Armadura',
                  itemTextController: _armorController,
                ),
                CharacteristicItem(
                  textItem: 'Poder de Fogo',
                  itemTextController: _firePowersController,
                )
              ]),
              const SizedBox(height: 10),

              // Tipos de Dano
              Characteristics(tittle: 'Tipos de Dano', item: [
                const SizedBox(height: 5),
                TextFieldCustom(
                  label: 'Força',
                  textController: _forceDamageController,
                ),
                const SizedBox(height: 10),
                TextFieldCustom(
                  label: 'Poder de Fogo',
                  textController: _firePowerDamageController,
                )
              ]),
              const SizedBox(height: 10),

              // Experiência
              Characteristics(tittle: 'Experiência', item: [
                CharacteristicItem(
                  textItem: 'Experiência',
                  itemTextController: _experienciaController,
                )
              ]),
              const SizedBox(height: 10),

              // Pontos de Vida
              Characteristics(tittle: 'Pontos de Vida', item: [
                CharacteristicItem(
                  textItem: 'Pontos de Vida',
                  itemTextController: _pontosDeVidaController,
                )
              ]),
              const SizedBox(height: 10),

              // Pontos de Magia
              Characteristics(tittle: 'Pontos de Magia', item: [
                CharacteristicItem(
                  textItem: 'Pontos de Magia',
                  itemTextController: _pontoDeMagiaController,
                )
              ]),
              const SizedBox(height: 10),

              // Caminhos da Magia
              Characteristics(tittle: 'Caminhos da Magia', item: [
                CharacteristicItem(
                  textItem: 'Água',
                  itemTextController: _waterController,
                ),
                CharacteristicItem(
                  textItem: 'Ar',
                  itemTextController: _airController,
                ),
                CharacteristicItem(
                  textItem: 'Fogo',
                  itemTextController: _fireController,
                ),
                CharacteristicItem(
                  textItem: 'Luz',
                  itemTextController: _lightController,
                ),
                CharacteristicItem(
                  textItem: 'Terra',
                  itemTextController: _earthController,
                ),
                CharacteristicItem(
                  textItem: 'Trevas',
                  itemTextController: _darknessController,
                )
              ]),
              const SizedBox(height: 10),

              // Vantagens
              Characteristics(
                tittle: 'Vantagens',
                item: [MultLineTextField(textController: _vantagemController)],
              ),
              const SizedBox(height: 10),

              // Desvantagens
              Characteristics(
                tittle: 'Desvantagens',
                item: [
                  MultLineTextField(textController: _desvantagemController)
                ],
              ),
              const SizedBox(height: 10),

              // Magias Conhecidas
              Characteristics(
                tittle: 'Magias Conhecidas',
                item: [MultLineTextField(textController: _magiasController)],
              ),
              const SizedBox(height: 10),

              // Dinheiro e Itens
              Characteristics(
                tittle: 'Dinheiro e Itens',
                item: [
                  MultLineTextField(textController: _dinheiroItemsController)
                ],
              ),
              const SizedBox(height: 10),

              // História
              Characteristics(
                tittle: 'História',
                item: [MultLineTextField(textController: _historiaController)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
