import 'dart:math';

import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/utils/database/database_util.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  Future<void> addCharacter(Character character) async {
    // final data = Character(
    //     id: character.id,
    //     name: character.name,
    //     advantage: character.advantage,
    //     disadvantage: character.disadvantage,
    //     spells: character.spells,
    //     moneyItems: character.moneyItems,
    //     history: character.history,
    //     healthPoints: character.healthPoints,
    //     experience: character.experience,
    //     magicPoints: character.magicPoints);

    DataBaseUtil.insert('characters', {
      'id': Random().nextDouble(),
      'name': character.name,
      'advantage': character.advantage,
      'disadvantage': character.disadvantage,
      'spells': character.spells,
      'moneyItems': character.moneyItems,
      'history': character.history,
      'healthPoints': character.healthPoints,
      'experience': character.experience,
      'magicPoints': character.magicPoints
    });

    notifyListeners();
  }
}
