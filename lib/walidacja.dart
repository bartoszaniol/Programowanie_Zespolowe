class Validator {
  Validator(this.board);
  final Map<String, int> board;

  Map<int, String> tileLetter = {
    1: 'A',
    2: 'B',
    3: 'C',
    4: 'D',
    5: 'E',
    6: 'F',
    7: 'G',
    8: 'H',
    9: 'I'
  };

  List validateSquare(int starti, int endi, int startj, int endj) {
    List<String> square = [];
    Map temp1 = {};
    for (int i = starti; i < endi; i++) {
      for (int j = startj; j < endj; j++) {
        if (board['${tileLetter[i]}$j'] != 0) {
          if (temp1.values.toList().contains(board['${tileLetter[i]}$j'])) {
            square.add('${tileLetter[i]}$j');
            var value = board['${tileLetter[i]}$j'];
            var tmp = temp1.keys.firstWhere(
                (element) => temp1[element] == value,
                orElse: () => null);
            if (tmp != null) {
              square.add(tmp);
            }
          } else {
            temp1['${tileLetter[i]}$j'] = board['${tileLetter[i]}$j'];
          }
        }
      }
    }
    return square;
  }

  List validate() {
    List<String> x = [];
    List<String> y = [];

    // walidacja kolumn
    for (int i = 1; i < 10; i++) {
      Map temp = {};
      for (int j = 1; j < 10; j++) {
        if (board['${tileLetter[i]}$j'] != 0) {
          if (temp.values.toList().contains(board['${tileLetter[i]}$j'])) {
            x.add('${tileLetter[i]}$j'); // dodaj 'id' duplikatu do listy
            var value = board['${tileLetter[i]}$j']; // wartosc dodanego id
            var tmp = temp.keys.firstWhere((k) => temp[k] == value,
                orElse: () =>
                    null); // znajdz pierwszy element duplikatu (bo sie nie dodal wczesniej)
            if (tmp != null) {
              x.add(tmp); // dodaj ten pierwszy element gdy nie jest zerem
            }
          } else {
            temp['${tileLetter[i]}$j'] = board['${tileLetter[i]}$j'];
          }
        }
      }
    }
    // walidacja wierszy
    for (int i = 1; i < 10; i++) {
      Map temp = {};
      for (int j = 1; j < 10; j++) {
        if (board['${tileLetter[j]}$i'] != 0) {
          if (temp.values.toList().contains(board['${tileLetter[j]}$i'])) {
            y.add('${tileLetter[j]}$i');
            var value = board['${tileLetter[j]}$i'];
            var tmp = temp.keys.firstWhere((element) => temp[element] == value,
                orElse: () => null);
            if (tmp != null) {
              y.add(tmp);
            }
          } else {
            temp['${tileLetter[j]}$i'] = board['${tileLetter[j]}$i'];
          }
        }
      }
    }

    x = x +
        y +
        validateSquare(1, 4, 1, 4) +
        validateSquare(1, 4, 4, 7) +
        validateSquare(1, 4, 7, 10) +
        validateSquare(4, 7, 1, 4) +
        validateSquare(4, 7, 4, 7) +
        validateSquare(4, 7, 7, 10) +
        validateSquare(7, 10, 1, 4) +
        validateSquare(7, 10, 4, 7) +
        validateSquare(7, 10, 7, 10);

    //usuwanie duplikatow i sortowanie
    x = x.toSet().toList()..sort();
    return x;
  }
}
