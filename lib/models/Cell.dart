class Cell{

  bool isAlive;

  int row;
  int column;

  Cell(this.row, this.column, [this.isAlive = false]);

  bool changeState(){
    isAlive = !isAlive;
  }

}