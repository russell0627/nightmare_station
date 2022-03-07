import '../data/combat.dart';

import '../data/items.dart';
import '../utils/console_utils.dart';
import 'item.dart';
import 'player_inventory.dart';

class Character {
  final String name;
  final int hunger;
  final int health;
  final PlayerInventory inventory;

  Item get flashlight => flashlightItem;

  Character({
    required this.hunger, 
    required this.health,
    required this.name,
    this.inventory = const PlayerInventory(),
  });

  @override
  String toString() => name;

  Character copyWith({
    String? name,
    PlayerInventory? inventory,
    int? hunger,
    int? health,
  }) {
    return Character(
      name: name ?? this.name,
      inventory: inventory ?? this.inventory,
      hunger: hunger ?? this.hunger,
      health: health ?? this.health
    );
  }

  Character damage ({required int damage}) {
    if(health - damage < 0) {
      character.copyWith(health: 0);
    }

    if(health - damage == 0) {
      printMessage("You have Died");
    }
    return copyWith(health: health - damage);
  }

  Character addItem(Item item) {
    if (item == pistol || item == rifle) {
      if(inventory.items.contains(pistol)) {
        final List<Item> returnableItems = inventory.items..remove(pistol)..add(item);

        return copyWith(inventory: PlayerInventory(items: returnableItems));
      }
      if (inventory.items.contains(rifle)) {
        final List<Item> returnableItems = inventory.items..remove(rifle)..add(item);

        return copyWith(inventory: PlayerInventory(items: returnableItems));
      }
    }
    return copyWith(inventory: inventory.addItem(item));
  }

  Character move({required Function areaFunction, int hungerCost = 1}) {
    areaFunction();

    return character.copyWith(hunger: hunger - hungerCost);
  }

}

Character character = Character(name: promptForStringExt("Character Name: "), hunger: 10, health: 10, );
int flashlightBrightness = 10;
