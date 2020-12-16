import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/MainPageConnector.dart';
import 'package:conways_game_of_life/widgets/Board.dart';
import 'package:flutter/material.dart';

int numberOfRows = 30;
int numberOfColumns = 30;
double boardWidth = 500;
double boardHeight = 500;
double cellWidth;
double cellHeight;
Store<Board> boardStore;

void main() {
  cellWidth = boardWidth / numberOfRows;
  cellHeight = boardHeight / numberOfColumns;


  boardStore = Store<Board>(
      initialState: Board(
    numberOfRows: numberOfRows,
    numberOfColumns: numberOfColumns,
    boardWidth: boardWidth,
    boardHeight: boardHeight,
    cellWidth: cellWidth,
    cellHeight: cellHeight,
  ));

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<Board>(
      store: boardStore,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPageConnector()));
}