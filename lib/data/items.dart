import '../models/door.dart';
import '../models/item.dart';
import 'areas.dart';
import 'combat.dart';

const flashlightItem = Item(name: "Flashlight",);
const HiddenItem startingRoomHiddenPistol = HiddenItem(pistol, 3);
const HiddenItem startingRoomHiddenPistolAmmo = HiddenItem(pistolAmmo, 3);


final keyToArea2 = Key(name: "Key to area 2", opens: doorToArea2);
final doorToArea2 = Door(leadsTo: area2,  locked: true, key: keyToArea2);

final doorToArea3 = Door(key: exampleKey, leadsTo: area3, locked: false);

final exampleKey = Key(name: "None", opens: exampleDoor);
final exampleDoor = Door(key: exampleKey, leadsTo: exampleArea, locked: false);

const HiddenItem area3OtherDoorRifle = HiddenItem(rifle, 5);
const HiddenItem area3OtherDoorRifleAmmo = HiddenItem(rifle, 5);