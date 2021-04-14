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
  List<String> wynik = [];
  List<int> tablicaWynikow = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wyniki.Wynik().readCounter().then((value) {
      setState(() {
        wynik = value;
        sortAndSub();
      });
    });
  }

  List<int> sortAndSub() {
    for (var element in wynik) {
      tablicaWynikow.add(int.parse(element));
    }
    tablicaWynikow.sort();
    return tablicaWynikow;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    // Map<String, dynamic> decodedCzas = jsonDecode(czasEncoded);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            // Image.network(
            //     'https://i.pinimg.com/originals/4d/22/ca/4d22ca8cf25a747ad3152163a0635e5f.gif'),
            // Text(wyniki.Wynik().wynikis[1].toString()),
            // Text(
            //   sortAndSub().toString(),
            //   style: TextStyle(color: Colors.grey),
            // ),
            Container(
              height: 300,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    tablicaWynikow.length < 5 ? tablicaWynikow.length : 5,
                itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                    tablicaWynikow[index].toString() + ' sek',
                    style: TextStyle(color: Colors.grey, fontSize: 32),
                  ));
                },
              ),
            ),
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
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
