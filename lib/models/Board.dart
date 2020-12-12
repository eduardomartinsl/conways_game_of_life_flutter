import 'package:flutter/material.dart';

class Board extends CustomPainter {
  //
  double cellWidth;
  double cellHeight;
  final int numberOfRows;
  final int numberOfColumns;
  List<List<bool>> isAlive;

  Board({
    this.numberOfRows,
    this.numberOfColumns,
    double width,
    double height,
  }) {
    cellWidth = width / numberOfRows;
    cellHeight = height / numberOfColumns;

    isAlive = List.generate(numberOfRows, (i) {
      return List.generate(numberOfColumns, (j) {
        return false;
      });
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset(0, 0) &
          Size(
            cellWidth * numberOfRows,
            cellHeight * numberOfColumns,
          ),
      Paint()..color = Colors.blue,
    );

    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        if (isAlive[row][column]) {
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
}