class GameSettings {
  GameSettings(
      {this.gameEdition,
      this.noOfPlayers,
      this.suspects,
      this.weapons,
      this.rooms});

  String gameEdition;
  int noOfPlayers;
  List<String> suspects;
  List<String> weapons;
  List<String> rooms;
}

/*
Maybe using this class will help me encapsulate the behaviour of the app
Still need to check!

14/12.2020

 */
