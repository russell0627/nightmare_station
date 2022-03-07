import '../components/console_menu.dart';
import '../models/character.dart';
import '../models/item.dart';
import '../models/nightmare.dart';
import '../utils/console_utils.dart';
import 'areas.dart';
import 'combat.dart';
import 'items.dart';

void openArea3TheBarricadedDoor() {
  printMessage(behindTheBarricadeInArea3.description);

  character.damage(damage: character.health);

}

void openTheArea3OtherDoor () {

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
    ConsoleMenuOption("Open The Barricaded Door", onSelect: ()
    {character.move(areaFunction: openArea3TheBarricadedDoor); return;}),
    ConsoleMenuOption("Open The Other Door", onSelect: () {character.move(areaFunction: openTheArea3OtherDoor); return;}),
  ]);
  return;
}
