import 'package:console/console.dart';
import 'package:nightmare_station/components/console_menu.dart';
import 'package:nightmare_station/data/area_functions.dart';
import 'package:nightmare_station/data/areas.dart';
import 'package:nightmare_station/data/combat.dart';
import 'package:nightmare_station/data/items.dart';
import 'package:nightmare_station/models/area.dart';
import 'package:nightmare_station/models/character.dart';
import 'package:nightmare_station/models/nightmare.dart';
import 'package:nightmare_station/utils/console_utils.dart';

// TODO: Fix Add Item For The Character.

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
    ConsoleMenuOption("Open Door", onSelect: () => doorToArea2.openDoor(areaFunction: startArea2)),
    ConsoleMenuOption("Search Room", onSelect: () => searchRoom(startingArea)),
    const ConsoleMenuOption("View Inventory", onSelect: viewInventory),
    ConsoleMenuOption("Fight A Nightmare", onSelect: () {printCombatMenu(nightmare: nightmare, gun: pistol, ammo: pistolAmmo); printMainMenu();}),
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



void printCredits () {
  const credit1 = "Coded By\nRussell Rasmussen";
  const credit2 = "Original Game Created By\nKieran Rasmussen";
  const inMemoryOf = "In The Memory Of\nFluffy, Chicky, Griselda, Gerard, Who Were The Chickens, and Dexter the Dog.";
  const endOfCredits = "END OF CREDITS";

  printMessage(credit1);
  printMessage(credit2);
  printMessage(inMemoryOf);
  printMessage(endOfCredits);
}

