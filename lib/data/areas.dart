import '../models/area.dart';

import 'items.dart';

const Area exampleArea = Area(name: "Example", description: "Example", playerInside: false);

const Area startingArea = Area(name: "Starting Area", description: "You are in a dark room with peeling pieces of wallpaper with, "
    "\nthe floor is creaky when you walk on it,\nthe room makes you feel nervous because you don't know what could have done this,\n"
    "on one of the walls there is a door that goes somewhere but you do not know where",
    playerInside: true, hiddenItems: [startingRoomHiddenPistol, startingRoomHiddenPistolAmmo, ]);

const Area area2 = Area(name: "Area 2", description: "In this room it is very dark, when you point your flashlight at one of the corners it seems to still be dark, "
    "you approach that corner, and suddenly you see some kind of all black creature with what looks like a human arm with many bite marks. "
    "The creature reminds you of a shadow you recall seeing one of these in a dream. You think that maybe this is just another dream, "
    "you want to think of a name for them, you start calling them nightmares,"
    "you know how ferocious they are and that they will attack,(if not evident by the severed human arm) so you decide to fight it.", playerInside: false);

const Area area3 = Area(name: "Area 3, Tombstone Room", description:
    "As you enter the room you see 2 tombstones a small one that says\"Dexter the Dog\nYou Are Missed Dearly\" on it the large one says \"The Chickens\nFluffy The Red\nChicky the Yellow,\n and Griselda the short lived\nYou Are Missed Dearly\"."
    "The room is relatively small, in front of the tombstones are graves with flowers on them they look like they have been there for a long time, "
    "you feel sad to see the graves there, but at least they don't have to deal with this horrible place. When you look around a bit more you see the corpse of a child that you think is around the age of twelve, "
    "he is holding a gun and when you check the magazine it is empty, "
    "he has similar bite marks to the ones that you saw on the arm in the previous room, you think that he might have made the graves for his lost pets, and was protecting their graves..."
    "You never want to see anything like that again."
    "There are two doors on two side of the room, one of them is not all the way closed,"
    "and the other has furniture barricading it, you think that you should probably not go through the barricaded door because there must be a reason,"
    "the door that is slightly open has footprints that look like they are from nightmares, you think those must be what got him."
    "You decide to close the door for now."
    "You are starting to feel hungry because it has been a while since you have last eaten."
    "You feel sad that the boy doesn't get to be buried like the others so you make a grave and tombstone out of some rocks that you find around the room.", playerInside: false);

const Area behindTheBarricadeInArea3 = Area(name: "Barricaded Off Room", description: "You manage to open the door despite the barricade blocking it."
    "You see lots of nightmares and the instantly overpower you. They rip you apart and eat you.", playerInside: false);

const Area areaThreeOtherDoor = Area(name: "Area 3 Other Door", description: "", playerInside: false, hiddenItems: []);
