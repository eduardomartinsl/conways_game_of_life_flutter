import 'dart:async';

import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/widgets/BoardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class BoardPage extends StatelessWidget {
  final Board board;
  final Function(int, int) drawCellCallback;
  final VoidCallback updateCycle;
  final bool isPaused;

  const BoardPage({
    Key key,
    this.updateCycle,
    this.board,
    this.drawCellCallback,
    this.isPaused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Timer timer = new Timer.periodic(Duration(milliseconds: 400), (Timer timer) {
    //   updateCycle();
    //   // if(isPaused) timer.cancel();
    // });

    Timer timer;

    return Scaffold(
      appBar: AppBar(
        title: Text("Conway`s Game of Life Sim"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BoardWidget(
              board: board,
              drawCellcallback: drawCellCallback,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            timer = Timer.periodic(Duration(milliseconds: 400), (Timer timer) {
              updateCycle();
            });
          },
          label: Text("Execute")),
    );
  }
}
