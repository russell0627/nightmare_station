import 'area.dart';
import 'character.dart';

class Game {
  final Character character;
  final Area currentArea;

  Game(this.character, this.currentArea);

  Game pauseGame(Area currentArea) {
    return Game(character, currentArea);
  }

  void resume(Function areaFunction) {
    areaFunction();
  }
}