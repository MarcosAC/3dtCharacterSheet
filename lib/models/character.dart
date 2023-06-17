import 'package:flutter/material.dart';

class Character extends ChangeNotifier {
  final String name;
  final String advantage;
  final String disadvantage;
  final String spells;
  final String moneyItems;
  final String history;
  final int healthPoints;
  final int experience;
  final int magicPoints;

  Character(
      this.name,
      this.advantage,
      this.disadvantage,
      this.spells,
      this.moneyItems,
      this.history,
      this.healthPoints,
      this.experience,
      this.magicPoints);
}
