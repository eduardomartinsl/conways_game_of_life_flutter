import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/BoardPageConnector.dart';
import 'package:flutter/material.dart';

import 'models/Board.dart';

Store<Board> boardStore;

int rowSize = 30;
int columnSize = 20;

void main() {
  boardStore = Store<Board>(initialState: Board());
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<Board>(
        store: boardStore,
        child: MaterialApp(
            title: 'Conway`s Game of Life Sim',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BoardPageConnector(
              rowSize: rowSize,
              columnSize: columnSize,
            )),
      );
}
