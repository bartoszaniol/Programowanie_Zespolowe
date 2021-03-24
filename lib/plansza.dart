import 'package:flutter/material.dart';
import 'gra.dart';

class Plansza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 2)),
      child: Table(
        border: TableBorder.all(width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: _getTableRows(),
      ),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(9, (int rowNumber) {
      return TableRow(children: _getRow(rowNumber));
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(9, (int colNumber) {
      return SudokuCell(rowNumber, colNumber);
    });
  }
}

class SudokuCell extends StatefulWidget {
  final int row, col;

  SudokuCell(this.row, this.col);

  @override
  _SudokuCellState createState() => _SudokuCellState();
}

int cyfra = 0;

List<List<int>> lista =
    new List.generate(9, (i) => [0, 0, 0, 0, 0, 0, 0, 0, 0]);

void zmiana(number) {
  cyfra = number;
}

void sprawdzenielisty() {
  for (int i = 0; i < 9; i++) {
    List temp = [];
    for (int j = 0; j < 9; j++) {
      if (lista[i][j] != 0) {
        if (temp.contains(lista[i][j])) {
          print("Duplikat to ${lista[i][j]}");
        } else {
          temp.add(lista[i][j]);
        }
      }
    }
  }
  for (int i = 0; i < 9; i++) {
    List temp = [];
    for (int j = 0; j < 9; j++) {
      if (lista[j][i] != 0) {
        if (temp.contains(lista[j][i])) {
          print("Duplikat to ${lista[j][i]}");
        } else {
          temp.add(lista[j][i]);
        }
      }
    }
  }
}

class _SudokuCellState extends State<SudokuCell> {
  Widget wypelnienie({int cyfra = 0}) {
    return cyfra > 0
        ? Text(
            '$cyfra',
            style: TextStyle(fontSize: 30),
          )
        : Text('');
  }

  Widget text = Text('');

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      customBorder: Border.all(width: 11),
      enableFeedback: true,
      onTap: () {
        print('${widget.row}, ${widget.col}');
        setState(() {
          text = wypelnienie(cyfra: cyfra);
          lista[widget.row][widget.col] = cyfra;
          // print(lista);
        });
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
