import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  Board({
    Key key,
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
  }) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<List<bool>> isAliveMatrix;

  void cellClick(PointerEvent e) {
    setState(() {
      isAliveMatrix[e.localPosition.dx ~/ widget.cellHeight]
      [e.localPosition.dy ~/ widget.cellHeight] =
      !isAliveMatrix[e.localPosition.dx ~/ widget.cellWidth]
      [e.localPosition.dy ~/ widget.cellHeight];
    });
  }

  @override
  void initState() {
    isAliveMatrix = List.generate(widget.numberOfRows, (i) {
      return List.generate(widget.numberOfColumns, (j) {
        return false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: cellClick,
      onPointerMove: cellClick,
      child: SizedBox(
        width: widget.boardWidth,
        height: widget.boardHeight,
        child: CustomPaint(
          painter: BoardCustomPainter(
              numberOfRows: widget.numberOfRows,
              numberOfColumns: widget.numberOfColumns,
              cellHeight: widget.cellHeight,
              cellWidth: widget.cellWidth,
              isAliveMatrix: isAliveMatrix),
        ),
      ),
    );
  }
}