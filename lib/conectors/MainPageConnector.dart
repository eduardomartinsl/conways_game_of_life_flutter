import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/factories/BoardFactory.dart';
import 'package:conways_game_of_life/pages/BoardPage.dart';
import 'package:conways_game_of_life/viewModels/BoardPageViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPageConnector extends StatelessWidget {
  MainPageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BoardPageViewModel>(
        vm: BoardFactory(this),
        builder: (
          BuildContext context,
          BoardPageViewModel vm,
        ) =>
            BoardPage(
              board: vm.board,
              onDrawCell: vm.onDrawCell,
              whoIsAlive: vm.whoIsAlive,
              updateTable: vm.updateTable,
              drawCellCallback: vm.drawCellCallback,
            ));
  }
}
