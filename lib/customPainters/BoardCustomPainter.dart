import 'package:flutter/material.dart';

class BoardCustomPainter extends CustomPainter {
  //
  double cellWidth;
  double cellHeight;
  final int numberOfRows;
  final int numberOfColumns;
  List<List<bool>> isAliveMatrix;

  BoardCustomPainter({
    this.numberOfRows,
    this.numberOfColumns,
    this.cellWidth,
    this.cellHeight,
    this.isAliveMatrix
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
        if (isAliveMatrix[row][column]) {
          renderCell(
            canvas,
            row * cellHeight,
            column * cellWidth,
            cellWidth,
            cellHeight,
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
  ) {
    canvas.drawRect(
      Offset(dx, dy) & Size(cellWidth, cellHeight),
      Paint()..color = Colors.black45,
    );
  }

  @override
  bool shouldRepaint(BoardCustomPainter oldDelegate) {
    return true;
  }
}
