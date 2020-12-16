import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/conectors/MainPageConnector.dart';
import 'package:conways_game_of_life/viewModels/BoardPageViewModel.dart';
import 'package:conways_game_of_life/widgets/Board.dart';
import 'package:flutter/cupertino.dart';

class BoardFactory extends VmFactory<AppState, MainPageConnector> {
  BoardFactory(widget) : super(widget);

  @override
  Vm fromStore() => BoardPageViewModel(
    numberOfRows: state.numberOfRows,
    numberOfColumns: state.numberOfColumns,
    boardWidth: state.boardWidth,
    boardHeight: state.boardHeight,
    cellWidth: state.cellWidth,
    cellHeight: state.cellHeight
  );
}