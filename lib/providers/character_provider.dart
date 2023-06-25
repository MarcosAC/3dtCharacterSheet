import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/utils/database/database_util.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  Future<void> addCharacter(Character character) async {
    DataBaseUtil.insert('characters', character.toMap());
    notifyListeners();
  }
}
