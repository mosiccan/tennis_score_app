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

getScore(int counter){
  List<String> score_list = ["0","15","30","40","Game","No-Ad","-"];
  return score_list[counter];
}

List<int> playedPoint_list = [];
Queue<int> playedPoint_Queue = new Queue<int>.from(playedPoint_list);

addPointLog(int player){
  playedPoint_Queue.add(player);
}

checkLastPoint(){
  return playedPoint_Queue.last;
}

removeLastLog(){
  playedPoint_Queue.removeLast();
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

  void _incrementCounter_p1() {
    setState(() {
      addPointLog(1);
      counter_p1++;
      if(counter_p1 == counter_p2 && counter_p1 == 3){  // 40:40 일 때 No-Ad로 표기
        counter_p1 += 2;
        getScore(counter_p2 += 2);
      }
      else if(counter_p1 == 6){
        counter_p1 -= 2;
        getScore(counter_p2++);
      }
      else if(counter_p1 == 4 && counter_p2 < 4){
        getScore(counter_p2 = 6);
      }
    });
  }

  void _increaseCounter_p2() {
    setState(() {
      addPointLog(2);
      counter_p2++;
      if(counter_p2 == counter_p1 && counter_p2 == 3){  // 40:40 일 때 No-Ad로 표기
        counter_p2 += 2;
        getScore(counter_p1 += 2);
      }
      else if(counter_p2 == 6){
        counter_p2 -= 2;
        getScore(counter_p1++);
      }
      else if(counter_p2 == 4 && counter_p1 < 4){
        getScore(counter_p1 = 6);
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
        counter_p2--;
        removeLastLog();
      }
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
            const Text(
              'Score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child:
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            getScore(counter_p1),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 42,
                            ),
                          ),
                        )
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(32, 0.0, 32, 0.0),
                          child: Text(':',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                            ),
                          ),
                        )
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child:
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getScore(counter_p2),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 42,
                            ),
                          ),
                        )
                    ),
                  ]
              ),
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
                      label: Text("Player 1")
                  ),
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
                )
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}