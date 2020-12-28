class NotesData {
  int noOfPlayers;
  int noOfSuspects;
  int noOfWeapons;
  int noOfRooms;

  List<List<bool>> suspectsData;
  List<List<bool>> weaponsData;
  List<List<bool>> roomsData;

  NotesData(
      {this.noOfPlayers, this.noOfSuspects, this.noOfWeapons, this.noOfRooms}) {

    // initialize the 3 lists
    suspectsData = <List<bool>>[];
    weaponsData = <List<bool>>[];
    roomsData = <List<bool>>[];

    // create suspects array
    for (int i = 0; i <= noOfSuspects; i++) {
      List<bool> dummyList = <bool>[];
      for (int j = 0; j <= noOfPlayers; j++) {
        dummyList.add(false);
      }
      suspectsData.add(dummyList);
    }

    // create weapons array
    for (int i = 0; i <= noOfWeapons; i++) {
      List<bool> dummyList = <bool>[];
      for (int j = 0; j <= noOfPlayers; j++) {
        dummyList.add(false);
      }
      weaponsData.add(dummyList);
    }

    // create rooms array
    for (int i = 0; i <= noOfRooms; i++) {
      List<bool> dummyList = <bool>[];
      for (int j = 0; j <= noOfPlayers; j++) {
        dummyList.add(false);
      }
      roomsData.add(dummyList);
    }
  }
}
