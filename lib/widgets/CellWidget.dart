import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  final Cell cell;

  final Function() callBack;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CellWidget &&
          runtimeType == other.runtimeType &&
          cell == other.cell;

  @override
  int get hashCode => super.hashCode ^ cell.hashCode ^ callBack.hashCode;

  const CellWidget({Key key, this.cell, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        decoration: BoxDecoration(
          color: cell.color,
          border: Border.all(color: Colors.black12),
        ),
      ),
    );
  }
}
