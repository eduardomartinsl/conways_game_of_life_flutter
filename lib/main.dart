import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/BoardPageConnector.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/material.dart';

import 'appState/AppState.dart';

int numberOfRows = 30;
int numberOfColumns = 30;
double boardWidth = 400;
double boardHeight = 400;
double cellWidth;
double cellHeight;

Store<AppState> store;

final white = Color.fromARGB(255, 255, 255, 255);
final black = Color.fromARGB(255, 0, 0, 0);
final green = Color.fromARGB(255, 31, 191, 36);
final blue = Color.fromARGB(255, 31, 76, 191);
final red = Color.fromARGB(255, 204, 22, 22);
final pink = Color.fromARGB(255, 213, 26, 219);

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;

  List<Color> predefinedColors = [black, green, blue, red, pink];

  Board board = Board(
      numberOfRows: numberOfRows,
      numberOfColumns: numberOfColumns,
      boardWidth: boardWidth,
      boardHeight: boardHeight,
      cellWidth: cellWidth,
      cellHeight: cellHeight,
      cells: initializeCellsList(),
      cellColor: predefinedColors[0]);

  var state = AppState.initialState(
      board: board,
      isPaused: true,
      predefinedColors: predefinedColors,
      selectedColorIndex: 0);

  store = Store<AppState>(initialState: state);

  runApp(MainPage());
}

List<List<Cell>> initializeCellsList() {
  return List.generate(numberOfRows, (i) {
    return List.generate(numberOfColumns, (j) {
      return Cell(color: white, isAlive: false);
    });
  });
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BoardPageConnector(),
      ));
}
