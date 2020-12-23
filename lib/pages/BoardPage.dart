import 'dart:async';

import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/widgets/BoardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class BoardPage extends StatefulWidget {
  final Board board;
  final Function(int, int) drawCellCallback;
  final VoidCallback updateCycle;
  final VoidCallback changeIsPaused;
  final bool isPaused;

  const BoardPage({
    Key key,
    this.board,
    this.drawCellCallback,
    this.updateCycle,
    this.isPaused,
    this.changeIsPaused,
  }) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 300), (Timer timer) {
      if (!widget.isPaused) widget.updateCycle();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              board: widget.board,
              drawCellcallback: widget.drawCellCallback,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(widget.isPaused ? Icons.play_arrow : Icons.pause),
          onPressed: widget.changeIsPaused,
          label: Text("Execute")),
    );
  }
}
