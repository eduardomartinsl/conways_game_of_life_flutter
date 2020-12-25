import 'package:flutter/material.dart';

class BoardCustomPainter extends CustomPainter {
  double cellWidth;
  double cellHeight;
  final int numberOfRows;
  final int numberOfColumns;
  List<List<bool>> isAliveMatrix;
  final Color cellColor;


  BoardCustomPainter({
    this.numberOfRows,
    this.numberOfColumns,
    this.cellWidth,
    this.cellHeight,
    this.isAliveMatrix,
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
        if (isAliveMatrix[row][column]) {
          renderCell(
            canvas,
            column * cellWidth,
            row * cellHeight,
            cellWidth,
            cellHeight,
            cellColor
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
