import 'package:flutter/material.dart';
import 'dart:collection';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Score System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Tennis Score System'),
    );
  }
}

getScore(int counter) {
  List<String> score_list = ["0", "15", "30", "40", "0", "No-Ad", "0"];
  return score_list[counter];
}

List<int> playedPoint_list = [];
Queue<int> playedPoint_Queue = new Queue<int>.from(playedPoint_list);

addPointLog(int player) {
  playedPoint_Queue.add(player);
}

checkLastPoint() {
  return playedPoint_Queue.last;
}

removeLastLog() {
  playedPoint_Queue.removeLast();
}

resetPointLog(){
  playedPoint_Queue.clear();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter_p1 = 0;
  int counter_p2 = 0;
  
  int previousPointCounter_p1 = 0;
  int previousPointCounter_p2 = 0;
  
  int gameCounter_p1 = 0;
  int gameCounter_p2 = 0;
  
  void savePreviousPoint(){
    previousPointCounter_p1 = counter_p1;
    previousPointCounter_p2 = counter_p2;
  }

  void _incrementCounter_p1() {
    setState(() {
      addPointLog(1);
      savePreviousPoint();
      counter_p1++;
      if(counter_p1 == counter_p2 && counter_p1 == 3){  // 40:40 일 때 No-Ad로 표기
        savePreviousPoint();
        counter_p1 += 2;
        getScore(counter_p2 += 2);
      }
      else if(counter_p1 == 6){                         // No-Ad 상황에서 득점
        savePreviousPoint();
        counter_p1 -= 2;
        getScore(counter_p2++);
        gameCounter_p1++;
        counter_p1 = 0;
        counter_p2 = 0;
      }
      else if(counter_p1 == 4 && counter_p2 < 4){       // 상대가 40까지 못 갔을때 득점
        savePreviousPoint();
        getScore(counter_p2 = 6);
        gameCounter_p1++;
        counter_p1 = 0;
        counter_p2 = 0;
      }
    });
  }

  void _increaseCounter_p2() {
    setState(() {
      addPointLog(2);
      savePreviousPoint();
      counter_p2++;
      if(counter_p2 == counter_p1 && counter_p2 == 3){// 40:40 일 때 No-Ad로 표기
        savePreviousPoint();
        counter_p2 += 2;
        getScore(counter_p1 += 2);
      }
      else if(counter_p2 == 6){                        // No-Ad 상황에서 득점
        savePreviousPoint();
        counter_p2 -= 2;
        getScore(counter_p1++);
        gameCounter_p2++;
        counter_p1 = 0;
        counter_p2 = 0;
      }
      else if(counter_p2 == 4 && counter_p1 < 4){      // 상대가 40까지 못 갔을때 득점
        savePreviousPoint();
        getScore(counter_p1 = 6);
        gameCounter_p2++;
        counter_p1 = 0;
        counter_p2 = 0;
      }
    });
  }

  void undoPoint(){
    setState(() {
      if(checkLastPoint() == 1){
        if(counter_p2 == counter_p1 && counter_p2 == 5){ // No-Ad 일 때 undo
          getScore(counter_p1 -= 3);
          getScore(counter_p2 -= 2);
          removeLastLog();
          return;
        }
        else if(gameCounter_p1 > 0 && counter_p1 == 0 && counter_p2 ==0){
          gameCounter_p1--;
          counter_p1 = previousPointCounter_p1;
          counter_p2 = previousPointCounter_p2;
          getScore(counter_p1);
          getScore(counter_p2);
          removeLastLog();
        }
        counter_p1--;
        removeLastLog();
      }
      else{
        if(counter_p2 == counter_p1 && counter_p2 == 5){  // No-Ad 일 때 undo
          getScore(counter_p2 -= 3);
          getScore(counter_p1 -= 2);
          removeLastLog();
          return;
        }
        else if(gameCounter_p2 > 0 && counter_p1 == 0 && counter_p2 ==0){
          gameCounter_p2--;
          counter_p1 = previousPointCounter_p1;
          counter_p2 = previousPointCounter_p2;
          getScore(counter_p1);
          getScore(counter_p2);
          removeLastLog();
        }
        counter_p2--;
        removeLastLog();
      }
    });
  }

  void resetPoint(){
    setState(() {
      getScore(counter_p1 = 0);
      getScore(counter_p2 = 0);
      gameCounter_p1 = 0;
      gameCounter_p2 = 0;
      resetPointLog();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                        'Serve',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Game',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Points',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Icon(Icons.sports_tennis)),
                      DataCell(Text('Player 1')),
                      DataCell(Text("$gameCounter_p1")),
                      DataCell(Text(getScore(counter_p1))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(' ')),
                      DataCell(Text('Player 2')),
                      DataCell(Text("$gameCounter_p2")),
                      DataCell(Text(getScore(counter_p2))),
                    ],
                  ),
                ],
              ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
              child: Text(
                'Information',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(

                )
              )
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: const Text(
                'Score',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        getScore(counter_p1),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    )),
                Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(32, 0.0, 32, 0.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    )),
                Flexible(
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getScore(counter_p2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    )),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 16, 32, 0.0),
                  child: FloatingActionButton.extended(
                      onPressed: _incrementCounter_p1,
                      tooltip: 'Player 1 gets point',
                      icon: Icon(Icons.add),
                      label: Text("Player 1")),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 16, 32, 0.0),
                  child: FloatingActionButton.extended(
                    onPressed: _increaseCounter_p2,
                    tooltip: 'Player 2 gets point',
                    icon: Icon(Icons.add),
                    label: Text("Player 2"),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.all(16),
                child: FloatingActionButton.extended(
                  onPressed: undoPoint,
                  elevation: 0.0,
                  backgroundColor: Colors.grey,
                  label: Icon(Icons.undo),
                ))
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
