class Character {
  final int? id;
  final String name;
  final int force;
  final int ability;
  final int resistance;
  final int armor;
  final int firePower;
  final int healthPoints;
  final int magicPoints;
  final String forceDamage;
  final String firePowerDamage;
  final int water;
  final int air;
  final int fire;
  final int light;
  final int earth;
  final int darkness;
  final String advantage;
  final String disadvantage;
  final String spells;
  final String moneyItems;
  final String history;
  final int experience;

  Character({
    this.id,
    required this.name,
    required this.force,
    required this.ability,
    required this.resistance,
    required this.armor,
    required this.firePower,
    required this.healthPoints,
    required this.magicPoints,
    required this.forceDamage,
    required this.firePowerDamage,
    required this.water,
    required this.air,
    required this.fire,
    required this.light,
    required this.earth,
    required this.darkness,
    required this.advantage,
    required this.disadvantage,
    required this.spells,
    required this.moneyItems,
    required this.history,
    required this.experience,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'force': force,
      'ability': ability,
      'resistance': resistance,
      'armor': armor,
      'firePower': firePower,
      'healthPoints': healthPoints,
      'magicPoints': magicPoints,
      'firePowerDamage': firePowerDamage,
      'water': water,
      'air': air,
      'fire': fire,
      'light': light,
      'earth': earth,
      'darkness': darkness,
      'advantage': advantage,
      'disadvantage': disadvantage,
      'spells': spells,
      'moneyItems': moneyItems,
      'history': history,
      'experience': experience,
    };
  }
}
