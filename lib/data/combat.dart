import '../components/console_menu.dart';
import '../models/fire_return.dart';
import '../models/item.dart';
import '../models/nightmare.dart';
import '../utils/console_utils.dart';

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

const Gun pistol = Gun(name: "Pistol", damage: 2, ammoType: AmmoType.pistol, magazineOrClipSize: 8, currentAmmo: 8);
const Ammo pistolAmmo = Ammo(name: "Pistol Ammo", ammoType: AmmoType.pistol, quantity: 30);
const Gun rifle = Gun(name: "Rifle", damage: 4, ammoType: AmmoType.rifle, magazineOrClipSize: 10, currentAmmo: 10);
const Ammo rifleAmmo = Ammo(name: "Rifle Ammo", ammoType: AmmoType.rifle, quantity: 30);

