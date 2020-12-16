import 'BoardState.dart';

class AppState {
  final BoardState boardState;

  AppState({this.boardState});

  AppState copy({BoardState boardState}){
    return AppState(boardState: boardState ?? this.boardState );
  }

  static AppState initialState() =>
      AppState(boardState: BoardState.initialState());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          boardState == other.boardState;

  @override
  int get hashCode => boardState.hashCode;
}

