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
  int _noOfPlayers = 6;
  int _noOfRooms = 0;
  int _noOfWeapons = 0;
  int _noOfSuspects = 0;

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

  List<Shadow> _getShadowForApp() {
    return <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 3.0,
        color: Colors.black,
      ),
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 8.0,
        color: Colors.black,
      ),
    ];
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
              onTap: () {},
              child: Icon(
                Icons.remove_red_eye_outlined,
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
      body: Container(
        color: Colors.blue,
        child: ListView(
          //shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              height: 50,
              color: Color.fromRGBO(14, 114, 166, 1),
              child: Center(
                child: Text(
                  'Who?',
                  style: GoogleFonts.fredokaOne(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 32.0,
                      shadows: _getShadowForApp(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: IntrinsicColumnWidth(),
                border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Center(
                      child: Text('Plum'),
                    ),
                    IconButton(icon: Icon(Icons.close), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                  ]),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text('Scarlett')),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Color.fromRGBO(14, 114, 166, 1),
              child: Center(
                child: Text(
                  'Weapon?',
                  style: GoogleFonts.balooBhaijaan(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 32.0,
                      shadows: _getShadowForApp(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: IntrinsicColumnWidth(),
                border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Center(child: Text('Plum')),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                  ]),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text('Scarlett the big lady')),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Color.fromRGBO(14, 114, 166, 1),
              child: Center(
                child: Text(
                  'Where?',
                  style: GoogleFonts.fredokaOne(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 32.0,
                      shadows: _getShadowForApp(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: IntrinsicColumnWidth(),
                border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Center(child: Text('Ballroom')),
                    IconButton(icon: Icon(null), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                    IconButton(icon: Icon(Icons.check), onPressed: null),
                  ]),
                  TableRow(
                    children: <Widget>[
                      Center(child: Text('Bedroom')),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                      IconButton(icon: Icon(Icons.check), onPressed: null),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
