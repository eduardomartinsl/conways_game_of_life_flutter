import 'dart:async';
import 'package:flutter/material.dart';

final Color cellColor = Colors.black45;
final Color bgColor = new Color.fromARGB(255, 245, 245, 255);
final TargetPlatform platform = TargetPlatform.android;

List<List<bool>> cells;
final tableWidth = 700.0, tableHeight = 400.0;
final numberOfRows = 30, numberOfColumns = 20;
double cellWidth, cellHeight;
bool paused = false, fillMode = true;

void main() {
  runApp(GameOfLife());
}

class TablePainter extends CustomPainter {
  List<List<bool>> hiddenMatrix1 = new List<List<bool>>(numberOfRows);
  List<List<bool>> hiddenMatrix2 = new List<List<bool>>(numberOfRows);

  TablePainter(double width, double height) {
    cellWidth = width / numberOfRows;
    cellHeight = height / numberOfColumns;
    cells = hiddenMatrix1;

    for (var i = 0; i < numberOfRows; i++) {
      hiddenMatrix1[i] = new List<bool>(numberOfColumns);
      hiddenMatrix2[i] = new List<bool>(numberOfColumns);
      for (var j = 0; j < numberOfColumns; j++) hiddenMatrix1[i][j] = false;
    }
  }

  void update() {
    if (paused) return;
    List<List<bool>> next = (cells == hiddenMatrix1 ? hiddenMatrix2 : hiddenMatrix1);
    for (var i = 0; i < numberOfRows; i++)
      for (var j = 0; j < numberOfColumns; j++) {
        int nCount = countNeighbours(i, j);
        next[i][j] = !cells[i][j] && nCount == 3 ||
            cells[i][j] && nCount >= 2 && nCount <= 3;
      }
    cells = next;
  }

  int countNeighbours(int x, int y) {
    int count = 0;
    for (var i = x - 1; i <= x + 1; i++)
      for (var j = y - 1; j <= y + 1; j++) {
        if (cells[(i + numberOfRows) % numberOfRows][(j + numberOfColumns) % numberOfColumns]) count++;
      }
    count -= (cells[x][y] ? 1 : 0);
    return count;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset(0, 0) & Size(cellWidth * numberOfRows, cellHeight * numberOfColumns),
        Paint()..color = bgColor);
    for (var i = 0; i < numberOfRows; i++)
      for (var j = 0; j < numberOfColumns; j++) {
        if (cells[i][j]) drawCell(canvas, i * cellWidth, j * cellHeight, cells[i][j]);
      }
  }

  @override
  bool shouldRepaint(TablePainter oldDelegate) {
    return true;
  }

  void drawCell(Canvas canvas, num x, num y, bool cellState) {
    canvas.drawRect(
        Offset(x, y) & Size(cellWidth, cellHeight), Paint()..color = cellColor);
  }
}

class GameOfLife extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameOfLifeState();
  }
}

class _GameOfLifeState extends State<GameOfLife> {
  IconData icon = Icons.pause;
  Timer timer;
  TablePainter painter = TablePainter(tableWidth, tableHeight);

  @override
  void initState() {
    timer = new Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {
        painter.update();
      });
    });
    super.initState();
  }

  void _pointerClick(PointerEvent e) {
    fillMode =
    !cells[e.localPosition.dx ~/ cellWidth][e.localPosition.dy ~/ cellHeight];
    _pointerDraw(e);
  }

  void _pointerDraw(PointerEvent e) {
    cells[e.localPosition.dx ~/ cellWidth][e.localPosition.dy ~/ cellHeight] =
        fillMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Conways Game of Flutter")),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Listener(
                  onPointerMove: _pointerDraw,
                  onPointerDown: _pointerClick,
                  child: SizedBox(
                    width: tableWidth,
                    height: tableHeight,
                    child: CustomPaint(
                      key: ValueKey(timer.tick),
                      painter: painter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: new Icon(icon, size: 25.0),
          onPressed: () {
            paused = !paused;
            icon = icon == Icons.pause ? Icons.play_arrow : Icons.pause;
          },
        ),
      ),
    );
  }
}