import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/utils/routes/app_routes.dart';
import 'package:dtcharactersheet/widgets/characteristic_item.dart';
import 'package:dtcharactersheet/widgets/characteristics.dart';
import 'package:dtcharactersheet/widgets/mult_line_text_field.dart';
import 'package:dtcharactersheet/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterSheetScreen extends StatefulWidget {
  const CharacterSheetScreen({super.key, this.character});

  final Character? character;

  @override
  State<CharacterSheetScreen> createState() => _CharacterSheetScreenState();
}

class _CharacterSheetScreenState extends State<CharacterSheetScreen> {
  bool isVisible = false;
  bool isEdit = false;

  final _nomeController = TextEditingController();
  final _forceController = TextEditingController();
  final _abilityController = TextEditingController();
  final _resistanceController = TextEditingController();
  final _armorController = TextEditingController();
  final _firePowersController = TextEditingController();
  final _healthPointsController = TextEditingController();
  final _magicPointsController = TextEditingController();
  final _forceDamageController = TextEditingController();
  final _firePowerDamageController = TextEditingController();
  final _waterController = TextEditingController();
  final _airController = TextEditingController();
  final _fireController = TextEditingController();
  final _lightController = TextEditingController();
  final _earthController = TextEditingController();
  final _darknessController = TextEditingController();
  final _advantageController = TextEditingController();
  final _disadvantageController = TextEditingController();
  final _spellsController = TextEditingController();
  final _moneyController = TextEditingController();
  final _historyController = TextEditingController();
  final _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.character != null) {
        isEdit = true;

        _nomeController.text = widget.character!.name;
        _forceController.text = widget.character!.force.toString();
        _abilityController.text = widget.character!.ability.toString();
        _resistanceController.text = widget.character!.resistance.toString();
        _armorController.text = widget.character!.armor.toString();
        _firePowersController.text = widget.character!.firePower.toString();
        _healthPointsController.text = widget.character!.healthPoints.toString();
        _magicPointsController.text = widget.character!.magicPoints.toString();
        _forceDamageController.text = widget.character!.forceDamage!;
        _firePowerDamageController.text = widget.character!.firePowerDamage!;
        _waterController.text = widget.character!.water.toString();
        _airController.text = widget.character!.air.toString();
        _fireController.text = widget.character!.fire.toString();
        _lightController.text = widget.character!.light.toString();
        _earthController.text = widget.character!.earth.toString();
        _darknessController.text = widget.character!.darkness.toString();
        _advantageController.text = widget.character!.advantage!;
        _disadvantageController.text = widget.character!.disadvantage!;
        _spellsController.text = widget.character!.spells!;
        _historyController.text = widget.character!.history!;
        _moneyController.text = widget.character!.moneyItems!;
        _experienceController.text = widget.character!.experience.toString();
      } else {
        _forceController.text = '0';
        _abilityController.text = '0';
        _resistanceController.text = '0';
        _armorController.text = '0';
        _firePowersController.text = '0';
        _healthPointsController.text = '0';
        _magicPointsController.text = '0';
        _waterController.text = '0';
        _airController.text = '0';
        _fireController.text = '0';
        _lightController.text = '0';
        _earthController.text = '0';
        _darknessController.text = '0';
        _experienceController.text = '0';
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ficha do Personagem - 3D&T"),
          titleTextStyle: const TextStyle(fontSize: 17),
          actions: [
            IconButton(
                onPressed: () {
                  Character newCharacter = Character(
                    id: widget.character?.id,
                    name: _nomeController.text,
                    force: int.parse(_forceController.text),
                    ability: int.parse(_abilityController.text),
                    resistance: int.parse(_resistanceController.text),
                    armor: int.parse(_armorController.text),
                    firePower: int.parse(_firePowersController.text),
                    healthPoints: int.parse(_healthPointsController.text),
                    magicPoints: int.parse(_magicPointsController.text),
                    forceDamage: _forceDamageController.text,
                    firePowerDamage: _firePowerDamageController.text,
                    water: int.parse(_waterController.text),
                    air: int.parse(_airController.text),
                    fire: int.parse(_fireController.text),
                    light: int.parse(_lightController.text),
                    earth: int.parse(_earthController.text),
                    darkness: int.parse(_darknessController.text),
                    advantage: _advantageController.text,
                    disadvantage: _disadvantageController.text,
                    spells: _spellsController.text,
                    moneyItems: _moneyController.text,
                    history: _historyController.text,
                    experience: int.parse(_experienceController.text),
                  );

                  if (isEdit) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertDialog(title: const Text('Editar Personagem'), content: const Text('Deseja editar personagem?'), actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                              TextButton(
                                  onPressed: () {
                                    try {
                                      Provider.of<CharacterProvider>(context, listen: false).updateCharacter(newCharacter);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                                  title: const Text('Sucesso! :D'),
                                                  content: const Text('Personagem editado com sucesso. :)'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () => Navigator.of(context)
                                                            .pushNamedAndRemoveUntil(AppRoutes.listCharacterScreen, (Route<dynamic> route) => false),
                                                        child: const Text('Ok')),
                                                  ]));
                                    } catch (e) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                                  title: const Text('Erro! :X'),
                                                  content: const Text('Erro ao editar personagem. :('),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop(AppRoutes.listCharacterScreen);
                                                        },
                                                        child: const Text('Ok'))
                                                  ]));
                                    }
                                  },
                                  child: const Text('Ok'))
                            ]));
                  } else {
                    try {
                      Provider.of<CharacterProvider>(context, listen: false).addCharacter(newCharacter);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(title: const Text('Sucesso! :D'), content: const Text('Personagem salvo com sucesso. :)'), actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.listCharacterScreen, (Route<dynamic> route) => false),
                                    child: const Text('Ok')),
                              ]));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(title: const Text('Erro! :X'), content: const Text('Erro ao salvar personagem. :('), actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Ok')),
                              ]));
                    }
                  }
                },
                icon: const Icon(Icons.save)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(AppRoutes.listCharacterScreen);
                },
                icon: const Icon(Icons.list))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFieldCustom(
                            label: 'Nome',
                            textController: _nomeController,
                          ))),

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
                      itemTextController: _experienceController,
                    )
                  ]),

                  const SizedBox(height: 10),

                  // Pontos de Vida
                  Characteristics(tittle: 'Pontos de Vida', item: [
                    CharacteristicItem(
                      textItem: 'Pontos de Vida',
                      itemTextController: _healthPointsController,
                    )
                  ]),

                  const SizedBox(height: 10),

                  // Pontos de Magia
                  Characteristics(tittle: 'Pontos de Magia', item: [
                    CharacteristicItem(
                      textItem: 'Pontos de Magia',
                      itemTextController: _magicPointsController,
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
                  Characteristics(tittle: 'Vantagens', item: [MultLineTextField(textController: _advantageController)]),

                  const SizedBox(height: 10),

                  // Desvantagens
                  Characteristics(tittle: 'Desvantagens', item: [MultLineTextField(textController: _disadvantageController)]),

                  const SizedBox(height: 10),

                  // Magias Conhecidas
                  Characteristics(tittle: 'Magias Conhecidas', item: [MultLineTextField(textController: _spellsController)]),

                  const SizedBox(height: 10),

                  // Dinheiro e Itens
                  Characteristics(tittle: 'Dinheiro e Itens', item: [MultLineTextField(textController: _moneyController)]),

                  const SizedBox(height: 10),

                  // História
                  Characteristics(tittle: 'História', item: [MultLineTextField(textController: _historyController)]),
                ]))));
  }
}

/* PARA FINS HISTÓRICO
Character character = Character(
                  name: _nomeController.text,
                  advantage: _advantageController.text,
                  disadvantage: _disadvantageController.text,
                  spells: _spellsController.text,
                  moneyItems: _moneyController.text,
                  history: _historyController.text,
                  healthPoints: int.parse(_healthPointsController.text),
                  experience: int.parse(_experienceController.text),
                  magicPoints: int.parse(_magicPointsController.text),
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
                );*/
