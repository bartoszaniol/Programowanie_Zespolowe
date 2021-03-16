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

class SudokuCell extends StatelessWidget {
  final int row, col;

  SudokuCell(this.row, this.col);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      enableFeedback: true,
      onTap: () {
        print('$row, $col');
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
