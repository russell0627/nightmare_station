import '../data/nightmare_abilities.dart';

class Nightmare {
  final String name;
  final int health;
  final Type type;
  final List<NightmareAbility> abilities;

  const Nightmare({required this.name, required this.type, required this.abilities, required this.health});

  Nightmare copyWith({
    int? health,
  }) {
    return Nightmare(
      name: name,
      health: health ?? this.health,
      type: type,
      abilities: abilities,
    );
  }

}

class NightmareAbility {
  final String name;
  final Function effect;

  const NightmareAbility(this.name, this.effect);

}

enum Type {
  nightmare,
  superNightmare,
  nightmareKing,
  nightmareMorale,
}

const Nightmare nightmare = Nightmare(name: "Nightmare", health: 5,type: Type.nightmare, abilities: [claw],);