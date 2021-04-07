class Wynik {
  final int czas;

  Wynik(this.czas);

  Wynik.fromJson(Map<String, dynamic> json) : czas = json['czas'];

  Map<String, dynamic> toJson() => {'czas': czas};
}
