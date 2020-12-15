import 'package:flutter/material.dart';

import 'customPainters/BoardCustomPainter.dart';

int numberOfRows = 30;
int numberOfColumns = 30;
double boardWidth = 500;
double boardHeight = 500;
double cellWidth;
double cellHeight;

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;

  runApp(NewMainPage());
}

class NewMainPage extends StatefulWidget {
  @override
  _NewMainPageState createState() => _NewMainPageState();
}

class _NewMainPageState extends State<NewMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Conway`s Game of Life Sim"),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Board(
                  numberOfRows: numberOfRows,
                  numberOfColumns: numberOfColumns,
                  boardWidth: boardWidth,
                  boardHeight: boardHeight,
                  cellWidth: cellWidth,
                  cellHeight: cellHeight,
                )
              ],
            ),
          ),
        ));
  }
}

class Board extends StatefulWidget {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final List<List<bool>> isAliveMatrix;
  final double cellWidth;
  final double cellHeight;

  const Board({
    Key key,
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.isAliveMatrix,
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
      isAliveMatrix[e.localPosition.dx ~/ cellHeight]
              [e.localPosition.dy ~/ cellHeight] =
          !isAliveMatrix[e.localPosition.dx ~/ cellWidth]
              [e.localPosition.dy ~/ cellHeight];
    });
  }

  @override
  void initState() {
    isAliveMatrix = List.generate(numberOfRows, (i) {
      return List.generate(numberOfColumns, (j) {
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
        width: boardWidth,
        height: boardHeight,
        child: CustomPaint(
          painter: BoardCustomPainter(
              numberOfRows: numberOfRows,
              numberOfColumns: numberOfColumns,
              cellHeight: cellHeight,
              cellWidth: cellWidth,
              isAliveMatrix: isAliveMatrix),
        ),
      ),
    );
  }
}
