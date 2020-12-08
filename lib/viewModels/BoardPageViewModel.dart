import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/cupertino.dart';

class BoardPageViewModel extends Vm {

  final Board boardState;
  final VoidCallback onIncrement;

  BoardPageViewModel({this.boardState, this.onIncrement});

}
