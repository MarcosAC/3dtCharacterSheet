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

  Character(
      {this.id,
      required this.name,
      required this.advantage,
      required this.disadvantage,
      required this.spells,
      required this.moneyItems,
      required this.history,
      required this.healthPoints,
      required this.experience,
      required this.magicPoints});

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
    };
  }
}
