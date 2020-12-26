import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/BoardPageConnector.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/material.dart';

import 'appState/AppState.dart';

int numberOfRows = 30;
int numberOfColumns = 30;
double boardWidth = 400;
double boardHeight = 400;
double cellWidth;
double cellHeight;

Store<AppState> store;

final black = Color.fromARGB(255, 0, 0, 0);
final green = Color.fromARGB(255, 31, 191, 36);
final blue = Color.fromARGB(255, 31, 76, 191);
final red = Color.fromARGB(255, 204, 22, 22);
final pink = Color.fromARGB(255, 213, 26, 219);

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;

  Board board = Board(
      numberOfRows: numberOfRows,
      numberOfColumns: numberOfColumns,
      boardWidth: boardWidth,
      boardHeight: boardHeight,
      cellWidth: cellWidth,
      cellHeight: cellHeight,
      whoIsAlive: initializeWhoIsAliveList(),
      cellColor: black);

  var predefinedColors = new List<Color>();

  predefinedColors.add(black);
  predefinedColors.add(green);
  predefinedColors.add(blue);
  predefinedColors.add(red);
  predefinedColors.add(pink);

  var state = AppState.initialState(
      board: board,
      isPaused: true,
      predefinedColors: predefinedColors,
      selectedColorIndex: 0);

  store = Store<AppState>(initialState: state);

  runApp(MainPage());
}

List<List<bool>> initializeWhoIsAliveList() {
  return List.generate(numberOfRows, (i) {
    return List.generate(numberOfColumns, (j) {
      return false;
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
