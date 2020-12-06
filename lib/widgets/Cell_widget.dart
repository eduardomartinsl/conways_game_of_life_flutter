import 'package:conways_game_of_life/models/CellPosition.dart';
import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {

  final CellPosition position;
  final Function() callBack;
  final Color color;

  const CellWidget({Key key, this.position, this.callBack, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        decoration: BoxDecoration(
            color:  color ,
            border: Border.all(color: Colors.black12)),
      ),
    );
  }
}