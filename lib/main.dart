import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/MainPageConnector.dart';
import 'package:flutter/material.dart';

import 'appState/AppState.dart';

int numberOfRows = 30;
int numberOfColumns = 30;
double boardWidth = 500;
double boardHeight = 500;
double cellWidth;
double cellHeight;

Store<AppState> store;

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;

  var state = AppState.initialState(
    numberOfRows: numberOfRows,
    numberOfColumns: numberOfColumns,
    boardWidth: boardWidth,
    boardHeight: boardHeight,
    cellWidth: cellWidth,
    cellHeight: cellHeight,
  );

  store = Store<AppState>(initialState: state);

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPageConnector(),
      ));
}
