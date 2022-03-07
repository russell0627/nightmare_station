import '../utils/console_utils.dart';
import 'area.dart';
import 'character.dart';
import 'item.dart';

class Door {
  final Area leadsTo;
  final bool locked;
  final Key key;

  Door({required this.key, required this.leadsTo, required this.locked});

  Door copyWith({
    bool? locked,
  }) {
    return Door(
      leadsTo: leadsTo,
      locked: locked ?? this.locked,
      key: key,
    );
  }

  void openDoor ({required Function areaFunction}) {
    if(locked == true) {
      if(character.inventory.items.contains(key)) {
        copyWith(locked: false);
        printMessage("You Opened The Door");
        leadsTo.copyWith(playerInside: true, explored: true);
        character.move(areaFunction: areaFunction);
      }
      printMessage("The door is locked and you do not have the key");
    }

    character.move(areaFunction: areaFunction);
  }

}
