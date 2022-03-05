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
    if(health - damage < 0 || health - damage == 0) {
      printMessage("You have Died");
    }
    return copyWith(health: health - damage);
  }

  Character addItem(Item item) {
    if (item == pistol || item == rifle) {
      if(inventory.items.contains(pistol)) {
        List<Item> returnableItems = inventory.items;
        returnableItems.remove(pistol);
        returnableItems.add(item);
        return copyWith(inventory: PlayerInventory(items: returnableItems));
      }
      if (inventory.items.contains(rifle)) {
        List<Item> returnableItems = inventory.items;
        returnableItems.remove(rifle);
        returnableItems.add(item);

        final newInventory = PlayerInventory(items: returnableItems);
        return copyWith(inventory: newInventory);
      }
    }
    return copyWith(inventory: inventory.addItem(item));
  }
}

Character character = Character(name: promptForStringExt("Character Name: "), hunger: 10, health: 10, );
int flashlightBrightness = 10;
