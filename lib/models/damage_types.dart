class DamageTypes {
  final int? idDamageTypes;
  final String force;
  final String firePower;

  DamageTypes({
    this.idDamageTypes,
    required this.force,
    required this.firePower,
  });

  Map<String, dynamic> toMap() {
    return {
      'force': force,
      'firePower': firePower,
    };
  }
}
