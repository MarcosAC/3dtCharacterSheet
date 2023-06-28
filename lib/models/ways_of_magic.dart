class WaysOfMagic {
  final int? idWaysOfMagic;
  final int water;
  final int air;
  final int fire;
  final int light;
  final int earth;
  final int darkness;

  WaysOfMagic({
    this.idWaysOfMagic,
    required this.water,
    required this.air,
    required this.fire,
    required this.light,
    required this.earth,
    required this.darkness,
  });

  Map<String, dynamic> toMap() {
    return {
      'water': water,
      'air': air,
      'fire': fire,
      'light': light,
      'earth': earth,
      'darkness': darkness,
    };
  }
}
