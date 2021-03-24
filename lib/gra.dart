import 'package:flutter/material.dart';

import './zegar.dart';
import './plansza.dart';

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Widget numberButton(number) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Container(
          width: mediaQuery.width * 0.18,
          height: mediaQuery.height * 0.1,
          child: RaisedButton(
            child: Text('$number', style: TextStyle(fontSize: 30)),
            onPressed: () {
              print('$number');
            },
            color: Colors.brown[600],
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          Zegar(),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Plansza(),
          SizedBox(
            height: mediaQuery.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              numberButton(1),
              numberButton(2),
              numberButton(3),
              numberButton(4),
              numberButton(5),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              numberButton(6),
              numberButton(7),
              numberButton(8),
              numberButton(9),
              Container(
                width: mediaQuery.width * 0.18,
                height: mediaQuery.height * 0.1,
                child: RaisedButton(
                  child: Icon(
                    Icons.delete,
                    size: 40,
                  ),
                  onPressed: () => print('Delete'),
                  color: Colors.brown[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.04,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                  iconSize: 50,
                ),
                IconButton(
                  icon: Icon(Icons.undo),
                  onPressed: () {},
                  iconSize: 50,
                ),
                IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {},
                  iconSize: 50,
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  iconSize: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
