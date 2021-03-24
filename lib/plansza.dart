import 'package:flutter/material.dart';

class Plansza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
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

void zmiana(number) {
  cyfra = number;
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
      enableFeedback: true,
      onTap: () {
        print('${widget.row}, ${widget.col}');
        setState(() {
          text = wypelnienie(cyfra: cyfra);
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
