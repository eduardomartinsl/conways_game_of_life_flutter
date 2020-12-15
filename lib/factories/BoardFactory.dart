import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/conectors/BoardPageConnector.dart';
import 'package:conways_game_of_life/customPainters/BoardCustomPainter.dart';
import 'package:conways_game_of_life/viewModels/BoardPageViewModel.dart';

class BoardFactory extends VmFactory<BoardCustomPainter, BoardPageConnector> {
  BoardFactory(widget) : super(widget);

  @override
  Vm fromStore() => BoardPageViewModel(
    boardState: state,
  );
}
