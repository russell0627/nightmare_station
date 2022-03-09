import '../models/door.dart';
import '../models/item.dart';
import 'areas.dart';
import 'combat.dart';

const flashlightItem = Item(name: "Flashlight",);
const HiddenItem startingRoomHiddenPistol = HiddenItem(pistol, 3);
const HiddenItem startingRoomHiddenPistolAmmo = HiddenItem(pistolAmmo, 3);


const keyToArea2 = Key(name: "Key to area 2", id: 2);
const hiddenKeyToArea2 = HiddenItem(keyToArea2, 3);
const doorToArea2 = Door(leadsTo: area2,  locked: true, keyID: 2);

const doorToArea3 = Door(keyID: 3, leadsTo: area3, locked: false);

const exampleKey = Key(name: "None", id: 0);
const exampleDoor = Door(keyID: 0, leadsTo: exampleArea, locked: false);

const HiddenItem area3OtherDoorRifle = HiddenItem(rifle, 5);
const HiddenItem area3OtherDoorRifleAmmo = HiddenItem(rifleAmmo, 5);