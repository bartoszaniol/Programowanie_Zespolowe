import 'package:flutter/material.dart';

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Widget numberButton(Widget number) {
      return Container(
        width: mediaQuery.width * 0.2,
        height: mediaQuery.height * 0.1,
        child: RaisedButton(
          child: number,
          onPressed: () {},
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.height * 0.6,
          ),
          Row(
            children: <Widget>[
              numberButton(Text('1')),
              numberButton(Text('2')),
              numberButton(Text('3')),
              numberButton(Text('4')),
              numberButton(Text('5')),
            ],
          ),
          Row(
            children: <Widget>[
              numberButton(Text('6')),
              numberButton(Text('7')),
              numberButton(Text('8')),
              numberButton(Text('9')),
              numberButton(Icon(Icons.delete)),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.1,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.refresh,
                  size: 60,
                ),
                Icon(
                  Icons.undo,
                  size: 60,
                ),
                Icon(
                  Icons.done,
                  size: 60,
                ),
                Icon(
                  Icons.edit,
                  size: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
