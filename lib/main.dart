import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/BoardPageConnector.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/material.dart';

import 'appState/AppState.dart';

int numberOfRows = 5;
int numberOfColumns = 5;
double boardWidth = 200;
double boardHeight = 200;
double cellWidth;
double cellHeight;

Store<AppState> store;

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;

  var whoIsAlive = initializeList();

  Board board = Board(
    numberOfRows: numberOfRows,
    numberOfColumns: numberOfColumns,
    boardWidth: boardWidth,
    boardHeight: boardHeight,
    cellWidth: cellWidth,
    cellHeight: cellHeight,
    whoIsAlive: whoIsAlive,
  );

  var state = AppState.initialState(board: board, isPaused: true);

  store = Store<AppState>(initialState: state);

  runApp(MainPage());
}

List<List<bool>> initializeList() {
  return List.generate(numberOfRows, (i) {
      return List.generate(numberOfRows, (j) {
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