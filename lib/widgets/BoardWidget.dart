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
  //todo inicializar matriz de uma maneira melhor
  List<List<bool>> isAlive = List<List<bool>>();

  @override
  Widget build(BuildContext context) {
    isAlive = List.generate(widget.rows, (i) {
      return List.generate(widget.columns, (j) {
        return true;
      });
    });

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.columns),
      //TODO: Entender o motivo do problema com a variável position (Que ultrapassa
      //TODO: a quantidade de células criadas
      itemBuilder: (context, position) {

        int rowNumber = (position / widget.columns).floor();
        int columnNumber = (position % widget.columns);

        print(" row:$rowNumber,  column:$columnNumber ${isAlive[rowNumber][columnNumber]}");

        return CellWidget(
          cell: Cell(color: Colors.white70),
          callBack: () => {
            setState(
              () => {
                // changeState(rowNumber, columnNumber)
              },
            )
          },
        );
      },
    );
  }

  bool changeState(int rowNumber, int columnNumber) {
    return isAlive[rowNumber][columnNumber] = !isAlive[rowNumber][columnNumber];
  }
}
