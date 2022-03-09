import '../utils/console_utils.dart';

import 'character.dart';
import 'door.dart';
import 'fire_return.dart';
import 'nightmare.dart';

class Item {
  final String name;

  const Item({required this.name});

  @override
  String toString() => "ITEM: $name";
}

class Tool extends Item {
  final Function use;
  const Tool({required String name, required this.use}) : super(name: name);
}

// class MeleeWeapon extends Item {
//   final int damage;
//
//   MeleeWeapon({required String name, required this.damage}) : super(name: name);
// }

class Gun extends Item {
  final int damage;
  final AmmoType ammoType;
  final int magazineOrClipSize;
  final int currentAmmo;

  const Gun({required String name, required this.damage, required this.ammoType, required this.magazineOrClipSize, required this.currentAmmo}) : super(name: name);

  Gun copyWith({
    int? currentAmmo,
  }) {
    return Gun(
      name: name,
      damage: damage,
      ammoType: ammoType,
      magazineOrClipSize: magazineOrClipSize,
      currentAmmo: currentAmmo ?? this.currentAmmo,
    );
  }

  Gun reload(Ammo ammo) {
    print("IN THE RELOADING FUNCTION");
// the bug happens on this line where it never passes the if or never gets a chance to do the check
    if(character.inventory.items.contains(ammo) && ammo.quantity <= magazineOrClipSize - currentAmmo) {
      print("INSIDE THE IF");
      if(currentAmmo == magazineOrClipSize){
        printMessage("Your gun is full");
        return this;
      }

      printMessage("Reloading Successful");
      return copyWith(currentAmmo: magazineOrClipSize);
    }
    printMessage("You don't have any ammo for this gun");
    return this;
  }

  FireReturn fire(Nightmare target) {
    if(currentAmmo == 0) {
      printError("Gun Is Empty");
      return FireReturn(this, target);
    }

    final gun = copyWith(currentAmmo: currentAmmo - 1);

    if(target.health < damage) {

      return FireReturn(gun, target.copyWith(health: 0));
    }

    final Nightmare damagedNightmare = Nightmare(name: target.name, type: target.type, abilities: target.abilities, health: target.health - damage);

    return FireReturn(gun, damagedNightmare);
  }
}

class HiddenItem {
  final Item item;
  final int brightnessRequired;

  const HiddenItem(this.item, this.brightnessRequired);

  bool get canPlayerSee => flashlightBrightness == brightnessRequired;
}

enum AmmoType {
  pistol,
  rifle,
}

class Ammo extends Item {
  final AmmoType ammoType;
  final int quantity;

  const Ammo({required String name, required this.ammoType, required this.quantity}) : super(name: name);

  Ammo copyWith({
    AmmoType? ammoType,
    int? quantity,
  }) {
    return Ammo(
      name: name,
      ammoType: ammoType ?? this.ammoType,
      quantity: quantity ?? this.quantity,
    );
  }

}

class Key extends Item {

  const Key({required String name}) : super(name: name);
}