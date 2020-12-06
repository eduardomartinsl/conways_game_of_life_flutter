import 'package:conways_game_of_life/widgets/Cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BoardPage extends StatelessWidget {

  final int rowCount;
  final int columnCount;

  BoardPage(int rowCount, int columnCount) : rowCount = rowCount, columnCount = columnCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conway`s Game of Life Sim")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount),
        itemBuilder: (context, position){

          int rowNumber = (position / columnCount).floor();
          int columnNumber = (position % columnCount);

          return Cell_widget(rowPosition: rowNumber,columnPosition: columnNumber,);
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
