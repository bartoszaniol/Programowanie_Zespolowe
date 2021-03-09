import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Body(),
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xff2b2420)));
  }
}

class Body extends StatelessWidget {
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
                onPressed: () {},
                child: Text(
                  "Graj",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 40),
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
                  "Wyjdz",
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
