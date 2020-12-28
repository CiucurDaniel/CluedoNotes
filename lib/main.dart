import 'package:cluedo_notes/GameSettings.dart';
import 'package:cluedo_notes/NotesData.dart';
import 'package:cluedo_notes/ui/table_header.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CluedoNotesApp());
}

class CluedoNotesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cluedo Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cluedo Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GameSettings _gameSettings;

  // no longer using the bool, instead use the _current index with the
  // mathematical formula
  bool _hideNotepad = false;
  int _currentStackIndex = 0;

  bool isIconPressed = false;

  NotesData _notesData;

  ScrollController _controller = new ScrollController();

  Icon iconChecked = Icon(
    Icons.check,
    color: Colors.black,
  );

  // this function handles user's choice on the PopUpMenu
  void _choiceAction(String choice) {
    if (choice == PopUpMenuConstants.clear_data) {
      print('i clicked clear data');
    }
    if (choice == PopUpMenuConstants.choose_game_edition) {
      print('I clicked choose game Edition');
    }
    if (choice == PopUpMenuConstants.select_number_of_players) {
      print('I clicked select number of players!');
    }
  }

  // create the table using this method which know hwo to generate a table for the current game settings
  // also give it the String section which can be "persons" "rooms" or "weapons"
  // then the function will create a table with the given section array
  Table _createTable(List<String> tableData, int noOfPlayers) {
    print('REACHED CREATE TABLE FUNC');
    // create a list to hold the rows
    List<TableRow> rows = [];

    // iterate trough elements and create a row
    for (int index = 0; index < tableData.length; index++) {
      print(tableData[index]);

      //Create the row
      TableRow tableRow = TableRow(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(tableData[index]),
          )
        ],
      );

      // Add elements in the row
      for (int player = 1; player <= noOfPlayers; player++) {
        tableRow.children.add(Checkbox(value: false, onChanged: null));
      }

      // Add the newly constructed row to the tables rows list
      rows.add(tableRow);
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.all(),
      children: rows,
    );
  }

  // this is the Alert Dialog which contains information on how to use the app
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must not tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cluedo Notes - How to'),
          content: Text(alert_dialog_description),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    //on app start up the default game edition is Cluedo Classic and no of players is 4
    setState(() {
      _gameSettings = GameSettings(
          gameEdition: game_edition_data[0]['edtion_name'],
          noOfPlayers: 4,
          suspects: game_edition_data[0]['persons'],
          rooms: game_edition_data[0]['location'],
          weapons: game_edition_data[0]['weapons']);

      _notesData = NotesData(
        noOfPlayers: 4,
        noOfSuspects: 6,
        noOfWeapons: 6,
        noOfRooms: 9,
      );

      print(_notesData.suspectsData);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title), old simple text title
        backgroundColor: Color.fromRGBO(4, 44, 96, 1),
        title: Image.asset(
          'assets/cluedo_logo_small.png',
          fit: BoxFit.fill,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentStackIndex = (_currentStackIndex + 1) % 2;
                });
              },
              child: Icon(
                _currentStackIndex == 1
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showMyDialog();
                });
              },
              child: Icon(
                Icons.help,
                size: 26.0,
              ),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: _choiceAction,
            itemBuilder: (BuildContext context) {
              return PopUpMenuConstants.menu_items_list.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentStackIndex,
        children: <Widget>[
          Container(
            color: Color.fromRGBO(99, 223, 246, 1),
            //color: Colors.blue,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                TableHeader(
                  title: 'Who?',
                ),
                Container(
                    color: Colors.white,
                    child: _createTable(
                        _gameSettings.suspects, _gameSettings.noOfPlayers)),
                TableHeader(
                  title: 'Weapon?',
                ),
                Container(
                    color: Colors.white,
                    child: _createTable(
                        _gameSettings.weapons, _gameSettings.noOfPlayers)),
                TableHeader(
                  title: 'Where?',
                ),
                Container(
                    color: Colors.white,
                    child: _createTable(
                        _gameSettings.rooms, _gameSettings.noOfPlayers)),
              ],
            ),
          ),
          Center(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Image.asset(
                            'assets/cluedo_hide_notepad_image.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
