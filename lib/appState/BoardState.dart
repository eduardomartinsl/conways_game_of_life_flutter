import 'package:flutter/foundation.dart';

class BoardState {

  final List<List<bool>> isAlive;

  BoardState({this.isAlive});

  BoardState copy({List<List<bool>> isAlive}) {
    return BoardState(
        isAlive: isAlive ?? this.isAlive);
  }

  static BoardState initialState() => BoardState(isAlive: const []);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is BoardState && runtimeType == other.runtimeType &&
        listEquals(isAlive, other.isAlive);
  }

  @override
  // TODO: implement hashCode
  //halp
  int get hashCode => super.hashCode;

}