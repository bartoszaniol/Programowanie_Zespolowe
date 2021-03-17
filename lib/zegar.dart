import 'package:flutter/material.dart';
import 'dart:async';

class Zegar extends StatefulWidget {
  @override
  _ZegarState createState() => _ZegarState();
}

class _ZegarState extends State<Zegar> {
  String greeting = "";
  Timer _timer;
  var czasM = DateTime.now().minute;
  var czasS = DateTime.now().second;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        greeting =
            "${DateTime.now().minute - czasM}:${DateTime.now().second - czasS}";
        print(greeting.toString());
      });
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        greeting,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
