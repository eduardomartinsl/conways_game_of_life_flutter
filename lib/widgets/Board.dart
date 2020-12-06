import 'package:conways_game_of_life/models/CellPosition.dart';
import 'package:flutter/material.dart';
import 'Cell_widget.dart';

class Board extends StatefulWidget {
  final columns;
  final rows;

  const Board({Key key, this.columns, this.rows}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.columns),
      itemBuilder: (context, position) {
        int rowNumber = (position / widget.columns).floor();
        int columnNumber = (position % widget.columns);

        bool isAlive = false;

        return CellWidget(
          position: CellPosition(row: rowNumber, column: columnNumber),
          color: isAlive ? Colors.black45 : Colors.white54,
          callBack: () => {isAlive = !isAlive, print(isAlive)},
        );
      },
    );
  }
}
