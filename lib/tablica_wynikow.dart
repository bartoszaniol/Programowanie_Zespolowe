import "package:flutter/material.dart";
import 'ekran_glowny.dart';
import 'wyniki.dart' as wyniki;
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
            Image.network(
                'https://i.pinimg.com/originals/4d/22/ca/4d22ca8cf25a747ad3152163a0635e5f.gif'),
            Text(wyniki.Wynik().wynikis[1].toString()),
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
