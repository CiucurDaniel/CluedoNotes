const game_edition_data = [
  {
    "edtion_name": "Cluedo Clasic",
    "persons": ["Mustard", "Plum", "Green", "Peackock", "Scarlet", "White"],
    "weapons": [
      "Dagger",
      "Candlestick",
      "Revelolver",
      "Rope",
      "Lead pipe",
      "Wrench"
    ],
    "location": [
      "Hall",
      "Lounge",
      "Dining room",
      "Kitchen",
      "Ball Room",
      "Biliard Room",
      "Conservatory",
      "Library",
      "Study"
    ]
  }
];

const String alert_dialog_description =
    'Cluedo notes is an app that helps you take notes during your cluedo game. \n\n - Tap a square to place a checkmark \n - The tree dots from the upper right side of the screen contain the menu \n - From the menu you can: \n \t\t Clear the notes \n \t\t Select game edition \n \t\t Set the number of players \n\n If you like the app please consider giving me a 5 star rating. \n\n Have fun!';

class PopUpMenuConstants {
  // used for item-pop-up menu
  static const String clear_data = 'Clear notes';
  static const String choose_game_edition = 'Choose game version';
  static const String select_number_of_players = 'Select number of players';

  static const List<String> menu_items_list = <String>[
    clear_data,
    choose_game_edition,
    select_number_of_players
  ];
}
