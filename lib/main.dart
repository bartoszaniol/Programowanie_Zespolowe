import 'package:flutter/material.dart';
import 'package:sudoku/ekran_glowny.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EkranGlowny(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff2b2420)),
    );
  }
}
