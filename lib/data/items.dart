import '../models/door.dart';
import '../models/item.dart';
import 'areas.dart';
import 'combat.dart';

const flashlightItem = Item(name: "Flashlight",);
const HiddenItem startingRoomHiddenPistol = HiddenItem(pistol, 3);
const HiddenItem startingRoomHiddenPistolAmmo = HiddenItem(pistolAmmo, 3);


const keyToArea2 = Key(name: "Key to area 2");
const hiddenKeyToArea2 = HiddenItem(keyToArea2, 3);
const doorToArea2 = Door(leadsTo: area2,  locked: true, key: keyToArea2);

const doorToArea3 = Door(key: exampleKey, leadsTo: area3, locked: false);

const exampleKey = Key(name: "None");
const exampleDoor = Door(key: exampleKey, leadsTo: exampleArea, locked: false);

const HiddenItem area3OtherDoorRifle = HiddenItem(rifle, 5);
const HiddenItem area3OtherDoorRifleAmmo = HiddenItem(rifleAmmo, 5);