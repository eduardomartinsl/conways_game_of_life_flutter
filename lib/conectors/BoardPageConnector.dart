import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/factories/BoardFactory.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/pages/BoardPage.dart';
import 'package:conways_game_of_life/viewModels/BoardPageViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BoardPageConnector extends StatelessWidget {
  BoardPageConnector({Key key, int rowSize, int columnSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<Board, BoardPageViewModel>(
      vm: BoardFactory(this),
      builder: (BuildContext context, BoardPageViewModel vm) => BoardPage(

        // rowCount: rowSize,
        // columnCount: columnSize,
      ),
    );
  }
}
