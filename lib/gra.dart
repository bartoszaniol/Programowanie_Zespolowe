import 'package:flutter/material.dart';
import './plansza.dart';

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Widget numberButton(Widget number) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Container(
          width: mediaQuery.width * 0.18,
          height: mediaQuery.height * 0.1,
          child: RaisedButton(
            child: number,
            onPressed: () {},
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
            height: mediaQuery.height * 0.1,
          ),
          Plansza(),
          SizedBox(
            height: mediaQuery.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              numberButton(Text('1', style: TextStyle(fontSize: 30))),
              numberButton(Text('2', style: TextStyle(fontSize: 30))),
              numberButton(Text('3', style: TextStyle(fontSize: 30))),
              numberButton(Text('4', style: TextStyle(fontSize: 30))),
              numberButton(Text('5', style: TextStyle(fontSize: 30))),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              numberButton(Text('6', style: TextStyle(fontSize: 30))),
              numberButton(Text('7', style: TextStyle(fontSize: 30))),
              numberButton(Text('8', style: TextStyle(fontSize: 30))),
              numberButton(Text('9', style: TextStyle(fontSize: 30))),
              numberButton(Icon(Icons.delete)),
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
