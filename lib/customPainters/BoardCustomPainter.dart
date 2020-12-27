import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/material.dart';

class BoardCustomPainter extends CustomPainter {
  double cellWidth;
  double cellHeight;
  final int numberOfRows;
  final int numberOfColumns;
  List<List<Cell>> cellsMatrix;
  final Color cellColor;

  BoardCustomPainter({
    this.numberOfRows,
    this.numberOfColumns,
    this.cellWidth,
    this.cellHeight,
    this.cellsMatrix,
    this.cellColor
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset(0, 0) &
          Size(
            cellWidth * numberOfRows,
            cellHeight * numberOfColumns,
          ),
      Paint()..color = Colors.white,
    );

    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        if (cellsMatrix[row][column].isAlive) {
          renderCell(
            canvas,
            column * cellWidth,
            row * cellHeight,
            cellWidth,
            cellHeight,
            cellsMatrix[row][column].color
          );
        }
      }
    }
  }

  void renderCell(
    Canvas canvas,
    double dx,
    double dy,
    double cellWidth,
    double cellHeight,
    Color cellColor,
  ) {
    canvas.drawRect(
      Offset(dx, dy) & Size(cellWidth, cellHeight),
      Paint()..color = cellColor,
    );
  }

  @override
  bool shouldRepaint(BoardCustomPainter oldDelegate) {
    return true;
  }
}
