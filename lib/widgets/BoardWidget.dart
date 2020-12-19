import 'dart:async';

import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  final List<List<bool>> whoIsAlive;
  final VoidCallback updateTable;
  final Function(int, int) drawCellcallback;

  BoardWidget({
    Key key,
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
    this.whoIsAlive,
    this.updateTable,
    this.drawCellcallback
  }) : super(key: key);

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  List<List<bool>> whoIsAlive;
  Timer timer;

  @override
  void initState() {
    whoIsAlive = widget.whoIsAlive;
    timer = new Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      //insert redux
      widget.updateTable();
      // setState(() {
      //   painter.update();
      // });
    });
    super.initState();
  }

  void changeCellState(PointerEvent e) {
    int column = e.localPosition.dx ~/ widget.cellWidth;
    int row = e.localPosition.dy ~/ widget.cellHeight;
    widget.drawCellcallback(row, column);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: changeCellState,
      onPointerMove: changeCellState,
      child: SizedBox(
        width: widget.boardWidth,
        height: widget.boardHeight,
        child: CustomPaint(
          painter: BoardCustomPainter(
              numberOfRows: widget.numberOfRows,
              numberOfColumns: widget.numberOfColumns,
              cellHeight: widget.cellHeight,
              cellWidth: widget.cellWidth,
              isAliveMatrix: whoIsAlive),
        ),
      ),
    );
  }
}
