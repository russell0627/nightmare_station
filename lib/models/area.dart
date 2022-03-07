import 'character.dart';
import 'item.dart';
import 'nightmare.dart';

class Area {
  final String name;
  final String description;
  final List<HiddenItem> hiddenItems;
  final bool playerInside;
  final bool explored;
  final List<Nightmare> nightmares;

  const Area({
    required this.name,
    required this.description,
    this.hiddenItems = const [],
    this.playerInside = false,
    this.explored = false,
    this.nightmares = const [],
  });

  Area copyWith({
    List<HiddenItem>? hiddenItems,
    bool? inventory,
    bool? playerInside,
    bool? explored,
  }) {
    return Area(
      name: name,
      description: description,
      hiddenItems: hiddenItems ?? this.hiddenItems,
      playerInside: playerInside ?? this.playerInside,
      explored: explored ?? this.explored,
      nightmares: nightmares,
    );
  }

  void searchArea(Area room) {
    for (final hiddenItem in room.hiddenItems) {
      if (hiddenItem.brightnessRequired <= flashlightBrightness) {
        character = character.addItem(hiddenItem.item);
      }
    }
    return;
  }

}