import 'package:console/console.dart';
import 'package:nightmare_station/components/console_menu.dart';
import 'package:nightmare_station/data/area_functions.dart';
import 'package:nightmare_station/data/areas.dart';
import 'package:nightmare_station/data/combat.dart';
import 'package:nightmare_station/data/items.dart';
import 'package:nightmare_station/models/area.dart';
import 'package:nightmare_station/models/character.dart';
import 'package:nightmare_station/models/fire_return.dart';
import 'package:nightmare_station/models/item.dart';
import 'package:nightmare_station/models/nightmare.dart';
import 'package:nightmare_station/utils/console_utils.dart';

// TODO: Implement rolling into the combat system using roller

void main() {
  viewCharacter();
  printMainMenu();
}

void printMainMenu() {
  Console.init();

  printConsoleMenu([
    const ConsoleMenuOption("Start Game", onSelect: startGame),
    const ConsoleMenuOption("View Character", onSelect: viewCharacter),
    const ConsoleMenuOption("Show Credits", onSelect: printCredits),
  ]);
}

void startGame () {
  printMessage(startingArea.description);
  printConsoleMenu([
    ConsoleMenuOption("Open Door", onSelect: () => doorToArea2.openDoor(areaFunction: startArea2, keyName: keyToArea2.name)),
    ConsoleMenuOption("Search Room", onSelect: () => searchRoom(startingArea)),
    const ConsoleMenuOption("View Inventory", onSelect: viewInventory),
    ConsoleMenuOption("Fight A Nightmare", onSelect: () => printCombatMenu(nightmare: nightmare, gun: pistol, ammo: pistolAmmo)),
  ]);
}

void viewInventory() {
  printMessage(character.inventory.toString());
  startGame();
}

void searchRoom(Area room) {
  for (final hiddenItem in room.hiddenItems) {
    if (hiddenItem.brightnessRequired <= flashlightBrightness) {
      character = character.addItem(hiddenItem.item);
    }
  }
  print(character.inventory);
  startGame();
}



void viewCharacter() {
  printMessage(character.toString());
  printMainMenu();
}

FireReturn printCombatMenu({required Nightmare nightmare, required Gun gun, required Ammo ammo}) {
  late FireReturn fireReturn;

  printConsoleMenu([
    ConsoleMenuOption("Fire", onSelect: ()
  {
    print("Firing");
    if (gun.currentAmmo == 0) {
      printMessage("You Reloaded because your gun was empty.");
      gun.reload(ammo);
      printCombatMenu(nightmare: nightmare, gun: gun, ammo: ammo);
      return FireReturn(gun, nightmare);
    }
    fireReturn = gun.fire(nightmare);
    nightmare.copyWith(health: fireReturn.nightmare.health);
    print("BANG!");
    if(nightmare.health <= 0) {
      nightmare.copyWith(health: 0);
      printMessage("You Killed The Nightmare");
      printMainMenu();
    }

    // ignore: parameter_assignments
    nightmare = fireReturn.nightmare;
    print(nightmare.health);
    printCombatMenu(nightmare: nightmare, gun: gun, ammo: ammo);
    return fireReturn;
  }),
    ConsoleMenuOption("Reload", onSelect: () {printMessage("Reloading"); gun.reload(ammo); printCombatMenu(nightmare: nightmare, gun: gun, ammo: ammo);})
  ]);

  return FireReturn(gun, nightmare);
}

void startArea2 () {
  printMessage(area2.description);

  const Nightmare area2Nightmare = Nightmare(name: "Area 2 Nightmare", type: Type.nightmare, abilities: [], health: 2);

  Gun weapon = pistol;

  if(character.inventory.items.contains(rifle)) {
    weapon = rifle;
  }

  printCombatMenu(nightmare: area2Nightmare, gun: weapon, ammo: pistolAmmo);

  printConsoleMenu([
    ConsoleMenuOption("Open the door", onSelect: () => doorToArea3.openDoor(areaFunction: startArea3)),
  ]);
}

void startArea3 () {
  printMessage(area3.description);

  printConsoleMenu([
    ConsoleMenuOption("Open The Barricaded Door", onSelect: () => character.move(areaFunction: openArea3TheBarricadedDoor)),
    ConsoleMenuOption("Open The Other Door", onSelect: () {character.move(areaFunction: openTheArea3OtherDoor);})
  ]);
}

void printCredits () {
  const credit1 = "Coded By\nRussell Rasmussen";
  const credit2 = "Original Game Created By\nKieran Rasmussen";
  const endOfCredits = "END OF CREDITS";

  printMessage(credit1);
  printMessage(credit2);
  printMessage(endOfCredits);
}