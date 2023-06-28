import 'package:dtcharactersheet/models/character_traits.dart';
import 'package:dtcharactersheet/models/damage_types.dart';
import 'package:dtcharactersheet/models/ways_of_magic.dart';

class Character {
  final int? id;
  final String name;
  final String advantage;
  final String disadvantage;
  final String spells;
  final String moneyItems;
  final String history;
  final int healthPoints;
  final int experience;
  final int magicPoints;
  final CharacterTraits characteristics;
  final WaysOfMagic waysOfMagic;
  final DamageTypes damageTypes;

  Character({
    this.id,
    required this.name,
    required this.advantage,
    required this.disadvantage,
    required this.spells,
    required this.moneyItems,
    required this.history,
    required this.healthPoints,
    required this.experience,
    required this.magicPoints,
    required this.characteristics,
    required this.waysOfMagic,
    required this.damageTypes,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'advantage': advantage,
      'disadvantage': disadvantage,
      'spells': spells,
      'moneyItems': moneyItems,
      'history': history,
      'healthPoints': healthPoints,
      'experience': experience,
      'magicPoints': magicPoints,
      'characteristics': characteristics,
      'waysOfMagic': waysOfMagic,
      'damageTypes': damageTypes,
    };
  }
}
