import 'package:flutter/material.dart';
import 'dart:async';

class Zegar extends StatefulWidget {
  final int czas;
  Zegar(this.czas);
  @override
  _ZegarState createState() => _ZegarState();
}

class _ZegarState extends State<Zegar> {
  String greeting = "";
  Timer _timer;
  // var czasM = (DateTime.now().millisecondsSinceEpoch / 1000).round();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        var czas = (DateTime.now().millisecondsSinceEpoch / 1000).round() -
            widget.czas;
        czas < 60
            ? greeting = "$czas"
            : greeting = "${czas ~/ 60}:${czas % 60}";
        // print(greeting.toString());
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
