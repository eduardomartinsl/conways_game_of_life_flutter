import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/material.dart';

class BoardPageViewModel extends Vm {
  final VoidCallback onDrawCell;
  final VoidCallback updateTable;
  Function(int, int) drawCellCallback;

  final Board board;
  final List<List<bool>> whoIsAlive;


  BoardPageViewModel({
    @required this.updateTable,
    @required this.onDrawCell,
    @required this.drawCellCallback,
    @required this.board,
    @required this.whoIsAlive,
  }) : super(equals: [
          board,
          whoIsAlive
        ]);
}
