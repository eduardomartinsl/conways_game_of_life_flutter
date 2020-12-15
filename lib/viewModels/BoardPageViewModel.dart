import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:flutter/cupertino.dart';

class BoardPageViewModel extends Vm {

  final BoardCustomPainter boardState;
  final VoidCallback onChangeState;

  BoardPageViewModel({this.boardState, this.onChangeState});

}
