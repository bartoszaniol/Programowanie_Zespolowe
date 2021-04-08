import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sudoku/ekran_glowny.dart';

import 'package:sudoku/zegar.dart';
import 'plansza.dart' as map;
import 'walidacja.dart' as validator;
import 'wyniki.dart';

class Gra extends StatefulWidget {
  @override
  _GraState createState() => _GraState();
}

class _GraState extends State<Gra> {
  int pointer = 0;
  String lastEditId;
  int lastEdit;
  Map<String, int> resetBoard;
  bool isValidate = false;
  var czas = (DateTime.now().millisecondsSinceEpoch / 1000).round();

  @override
  void initState() {
    super.initState();
    List<List<String>> litery = [
      ["A", "B", "C"],
      ["D", "E", "F"],
      ["G", "H", "I"]
    ];
    List<List<int>> rzad = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        losowanie(litery[i], rzad[j]);
      }
    }
    resetBoard = Map.from(map.mapBoard);
  }

  void losowanie(List<String> litery, List<int> rzad) {
    var rng = Random();
    for (int i = 0; i < 3; i++) {
      int wybranyRzad = rng.nextInt(5) + rzad[0];
      String wybranaLitera = litery[rng.nextInt(3)];

      while (true) {
        int wybranaCyfra = rng.nextInt(9) + 1;
        map.mapBoard["$wybranaLitera$wybranyRzad"] = wybranaCyfra;
        if (validator.Validator(map.mapBoard).validate().length == 0) {
          break;
        }
      }
    }
  }

  Color changeColor(String idMap) {
    if (!isValidate) {
      return Colors.grey;
    } else {
      var tmp = validator.Validator(map.mapBoard).validate();
      if (tmp.contains(idMap)) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }

  bool sprawdzenie(Map mapa) {
    int i = 0;
    mapa.forEach((k, v) {
      if (v == 0) {
        i++;
      }
    });
    if (i > 0) {
      return false;
    } else {
      return true;
    }
  }

  Widget numberButton(int thisPointer) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pointer = thisPointer;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.brown[600]),
            borderRadius: BorderRadius.circular(40),
            color: Colors.brown[600]),
        width: 70,
        height: 70,
        child: Center(
          child: thisPointer != 0
              ? Text(
                  '$thisPointer',
                  style: TextStyle(fontSize: 30),
                )
              : Icon(Icons.delete),
        ),
      ),
    );
  }

  Future<void> winerwinerchickendiner(BuildContext context) async {
    int wynik = (DateTime.now().millisecondsSinceEpoch / 1000).round() - czas;
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            backgroundColor: Colors.brown[600],
            content: Container(
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Wygrales !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Twoj wynik to : $wynik",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        map.mapBoard = Map.from(resetBoard);
                      });
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) => EkranGlowny(),
                        ),
                      );
                    },
                    child: Text(
                      "Powrot do menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Zegar(czas),
          Container(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                itemCount: 81,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9),
                itemBuilder: (context, index) {
                  var xIndex = index % 9;
                  var yIndex = (index / 9).floor();
                  var tileId = '${tileLetter[xIndex]}${yIndex + 1}';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        lastEdit = map.mapBoard[tileId];
                        lastEditId = tileId;
                        map.mapBoard.update(tileId, (_) => pointer);
                        if (sprawdzenie(map.mapBoard)) {
                          if (validator.Validator(map.mapBoard)
                                  .validate()
                                  .length ==
                              0) {
                            var koncowyczas =
                                (DateTime.now().millisecondsSinceEpoch / 1000)
                                        .round() -
                                    czas;
                            print(koncowyczas);
                            Wynik czasKoncowy = Wynik(koncowyczas);

                            winerwinerchickendiner(context);
                          }
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: xIndex % 3 == 0 ? 4 : 1,
                              color: Colors.grey),
                          right: BorderSide(
                              width: xIndex == 8 ? 4 : 1, color: Colors.grey),
                          bottom: BorderSide(
                              width: yIndex % 3 == 0 ? 4 : 1,
                              color: Colors.grey),
                          top: BorderSide(
                              width: yIndex == 8 ? 4 : 1, color: Colors.grey),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          map.mapBoard[tileId] == 0
                              ? ''
                              : map.mapBoard[tileId].toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: changeColor(tileId)), //changeColor(tileId)
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              numberButton(1),
              numberButton(2),
              numberButton(3),
              numberButton(4),
              numberButton(5),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              numberButton(6),
              numberButton(7),
              numberButton(8),
              numberButton(9),
              numberButton(0),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 40,
                icon: Icon(Icons.undo),
                onPressed: () {
                  setState(() {
                    map.mapBoard.update(lastEditId, (_) => lastEdit);
                  });
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    map.mapBoard = Map.from(resetBoard);
                    czas =
                        (DateTime.now().millisecondsSinceEpoch / 1000).round();
                  });
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(Icons.done),
                onPressed: () {
                  validator.Validator(map.mapBoard).validate();
                  setState(() {
                    if (isValidate == true) {
                      isValidate = false;
                    } else {
                      isValidate = true;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<int, String> tileLetter = {
    0: 'A',
    1: 'B',
    2: 'C',
    3: 'D',
    4: 'E',
    5: 'F',
    6: 'G',
    7: 'H',
    8: 'I'
  };
}
