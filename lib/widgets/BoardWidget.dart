import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/material.dart';
import 'CellWidget.dart';

class BoardWidget extends StatefulWidget {
  final columns;
  final rows;

  const BoardWidget({Key key, this.columns, this.rows}) : super(key: key);

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  List<List<bool>> isAlive = List<List<bool>>();

  @override
  void initState() {
    super.initState();

    isAlive = List.generate(widget.rows, (i) {
      return List.generate(widget.columns, (j) {
        return false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.columns),
      itemCount: (widget.columns * widget.rows),
      itemBuilder: (context, position) {
        int rowNumber = (position / widget.columns).floor();
        int columnNumber = (position % widget.columns);

        print(
            " row:$rowNumber, column:$columnNumber ${isAlive[rowNumber][columnNumber]}");

        return CellWidget(
          cell: Cell(
              color: isAlive[rowNumber][columnNumber]
                  ? Colors.black87
                  : Colors.white70),
          callBack: () => {
            setState(
              () {
                return isAlive[rowNumber][columnNumber] =
                    !isAlive[rowNumber][columnNumber];
              },
            )
          },
        );
      },
    );
  }
}
