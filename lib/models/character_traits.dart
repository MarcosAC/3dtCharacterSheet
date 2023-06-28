class CharacterTraits {
  final int? idCharacteristics;
  final int force;
  final int ability;
  final int resistance;
  final int armor;
  final int firePower;

  CharacterTraits({
    this.idCharacteristics,
    required this.force,
    required this.ability,
    required this.resistance,
    required this.armor,
    required this.firePower,
  });

  Map<String, dynamic> toMap() {
    return {
      'force': force,
      'ability': ability,
      'resistance': resistance,
      'armor': armor,
      'firePower': firePower,
    };
  }
}
