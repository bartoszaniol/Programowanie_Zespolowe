import "package:flutter/material.dart";
import 'ekran_glowny.dart';
import 'dart:convert';
import 'gra.dart';

class TablicaWynikow extends StatefulWidget {
  TablicaWynikow({Key key}) : super(key: key);

  @override
  _TablicaWynikowState createState() => _TablicaWynikowState();
}

class _TablicaWynikowState extends State<TablicaWynikow> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    // Map<String, dynamic> decodedCzas = jsonDecode(czasEncoded);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.height * 0.1,
            ),
            Text(
              "Tabela Wynikow",
              style: TextStyle(fontSize: 40.0, color: Color(0xffa59b66)),
            ),
            SizedBox(
              height: 50,
            ),
            // ListView(),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => EkranGlowny(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
