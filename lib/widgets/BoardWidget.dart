import 'dart:async';

import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  final Board board;
  final List<List<bool>> whoIsAlive;
  final VoidCallback updateTable;
  final Function(int, int) drawCellcallback;

  BoardWidget({
    Key key,
    this.board,
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
    int row = e.localPosition.dx ~/ widget.board.cellWidth;
    int column = e.localPosition.dy ~/ widget.board.cellHeight;
    widget.drawCellcallback(row, column);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: changeCellState,
      onPointerMove: changeCellState,
      child: SizedBox(
        width: widget.board.boardWidth,
        height: widget.board.boardHeight,
        child: CustomPaint(
          painter: BoardCustomPainter(
              numberOfRows: widget.board.numberOfRows,
              numberOfColumns: widget.board.numberOfColumns,
              cellHeight: widget.board.cellHeight,
              cellWidth: widget.board.cellWidth,
              isAliveMatrix: whoIsAlive),
        ),
      ),
    );
  }
}
