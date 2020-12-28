import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
This widget is
 */
class TableHeader extends StatelessWidget {
  TableHeader({this.title});

  final String title;

  // method used to get shadow for -> WHO, WEAPON, WHERE
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
    return Container(
      height: 50,
      color: Color.fromRGBO(4, 44, 96, 1),
      child: Center(
        child: Text(
          title,
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
    );
  }
}


// style: GoogleFonts.balooBhaijaan
// original table header color: color: Color.fromRGBO(14, 114, 166, 1),

// ne style for background ->rgb(104, 226, 247)