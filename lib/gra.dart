import 'package:flutter/material.dart';

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Widget numberButton(String number) {
      return Container(
        width: mediaQuery.width * 0.2,
        height: mediaQuery.height * 0.1,
        child: RaisedButton(
          child: Text(number),
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
              numberButton('1'),
              numberButton('2'),
              numberButton('3'),
              numberButton('4'),
              numberButton('5'),
            ],
          ),
          Row(
            children: <Widget>[
              numberButton('6'),
              numberButton('7'),
              numberButton('8'),
              numberButton('9'),
              numberButton('X'),
            ],
          ),
        ],
      ),
    );
  }
}
