import 'dart:convert';

class Wynik {
  final int czas;
  Wynik({this.czas});

  Map<int, int> wynikis = {1: 0};
  
  // var wynikiJson = jsonEncode(wynikis);

  void addToMap() {}

  // Wynik.fromJson(Map<String, dynamic> json) : czas = json['czas'];

  // Map<String, dynamic> toJson() => {'czas': czas};
}
