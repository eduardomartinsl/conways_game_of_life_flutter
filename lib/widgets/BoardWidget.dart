import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final Function(int, int) drawCellcallback;

  const BoardWidget({
    Key key,
    this.board,
    this.drawCellcallback,
  }) : super(key: key);

  void changeCellState(PointerEvent e) {
    int column = e.localPosition.dx ~/ board.cellWidth;
    int row = e.localPosition.dy ~/ board.cellHeight;
    drawCellcallback(row, column);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: changeCellState,
      onPointerMove: changeCellState,
      child: SizedBox(
        width: board.boardWidth,
        height: board.boardHeight,
        child: CustomPaint(
          painter: BoardCustomPainter(
            numberOfRows: board.numberOfRows,
            numberOfColumns: board.numberOfColumns,
            cellHeight: board.cellHeight,
            cellWidth: board.cellWidth,
            isAliveMatrix: board.whoIsAlive,
          ),
        ),
      ),
    );
  }
}
