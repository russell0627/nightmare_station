import '../models/character.dart';
import '../models/nightmare.dart';

const NightmareAbility powerDrain = NightmareAbility("Power Drain", usePowerDrain);
const NightmareAbility claw = NightmareAbility("Claw", useClaw);

void usePowerDrain () {
  flashlightBrightness--;
}

void useClaw () {
  character.copyWith(health: character.health - 1);
}