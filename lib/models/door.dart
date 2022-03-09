import '../utils/console_utils.dart';
import 'area.dart';
import 'character.dart';
import 'item.dart';

class Door {
  final Area leadsTo;
  final bool locked;
  final int keyID;

  const Door({required this.keyID, required this.leadsTo, required this.locked});

  Door copyWith({
    bool? locked,
  }) {
    return Door(
      leadsTo: leadsTo,
      locked: locked ?? this.locked,
      keyID: keyID,
    );
  }

  void openDoor ({required Function areaFunction, String keyName = ""}) {
    if(locked == true) {
      if(character.inventory.items.contains(Key(name: keyName, id: keyID))) {
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
