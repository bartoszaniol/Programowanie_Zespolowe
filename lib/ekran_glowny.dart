import 'package:flutter/material.dart';

import 'package:sudoku/gra.dart';
import 'package:sudoku/tablica_wynikow.dart';

class EkranGlowny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SUDOKU",
              style: TextStyle(fontSize: 60.0, color: Color(0xffa59b66)),
            ),
            Image.network('https://i.imgur.com/wFFlZ8t.png'),
            Container(
              width: mediaQuery.width * 0.6,
              height: mediaQuery.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffd9d6ca)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                // color: Colors.grey,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                // padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => Gra(),
                    ),
                  );
                },
                child: Text(
                  "Graj",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: mediaQuery.width * 0.6,
              height: mediaQuery.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffd9d6ca)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                // padding: EdgeInsets.all(8.0),
                // splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => TablicaWynikow(),
                    ),
                  );
                },
                child: Text(
                  "Tabela wynikow",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: mediaQuery.width * 0.6,
              height: mediaQuery.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffd9d6ca)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                // padding: EdgeInsets.all(8.0),
                // splashColor: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  "Wyjdź",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
