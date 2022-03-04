import '../models/door.dart';
import '../models/item.dart';
import 'areas.dart';

const flashlightItem = Item(name: "Flashlight",);
const HiddenItem startingRoomHiddenPistol = HiddenItem(pistol, 3);
const Gun pistol = Gun(name: "Pistol", damage: 2, ammoType: AmmoType.pistol, magazineOrClipSize: 8, currentAmmo: 8);
const Ammo pistolAmmo = Ammo(name: "Pistol Ammo", ammoType: AmmoType.pistol, quantity: 30);
const HiddenItem startingRoomHiddenPistolAmmo = HiddenItem(pistolAmmo, 3);
const Gun rifle = Gun(name: "Rifle", damage: 4, ammoType: AmmoType.rifle, magazineOrClipSize: 10, currentAmmo: 10);
const Ammo rifleAmmo = Ammo(name: "Rifle Ammo", ammoType: AmmoType.rifle, quantity: 30);

final keyToArea2 = Key(name: "Key to area 2", opens: doorToArea2);
final doorToArea2 = Door(leadsTo: area2,  locked: true, key: keyToArea2);

final exampleKey = Key(name: "None", opens: exampleDoor);
final exampleDoor = Door(key: exampleKey, leadsTo: exampleArea, locked: false);

const HiddenItem area3OtherDoorRifle = HiddenItem(rifle, 5);
const HiddenItem area3OtherDoorRifleAmmo = HiddenItem(rifle, 5);