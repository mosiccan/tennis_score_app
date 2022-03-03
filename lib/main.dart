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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> scoreList = ["0", "15", "30", "40"]; // '포인트' 리스트

  List<String> pointLogListP1 = ["0"];  // Player1의 포인트 로그 리스트
  List<String> pointLogListP2 = ["0"];  // Player2의 포인트 로그 리스트

  List<int> orderOfPlay = []; // 득점순서 기록용 리스트
  
  List<int> lastCounterOfGameListP1 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장
  List<int> lastCounterOfGameListP2 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장

  int counterP1 = 0;  // Player1의 '포인트' 지정 변수
  int counterP2 = 0;  // Player2의 '포인트' 지정 변수

  int gameCounterP1 = 0;  // Player1의 '게임' 스코어 지정 변수
  int gameCounterP2 = 0;  // Player2의 '게임' 스코어 지정 변수

  void addPointToLogP1(int counter){  // Player1 포인트 로그 리스트에 '포인트' 추가
    pointLogListP1.add(scoreList[counter]);
  }

  void addPointToLogP2(int counter){  // Player2 포인트 로그 리스트에 '포인트' 추가
    pointLogListP2.add(scoreList[counter]);
  }

  String currentPointP1(){  // Player1의 현재 '포인트' 반환
    return pointLogListP1.last;
  }

  String currentPointP2(){  // Player2의 현재 '포인트' 반환
    return pointLogListP2.last;
  }

  void removeLog(){ // 모든 Player의 마지막 포인트 로그 제거
    pointLogListP1.removeLast();
    pointLogListP2.removeLast();
  }

  void resetGameLog(){  // 모든 게임 '로그' 초기화 "All Reset"
    pointLogListP1.clear();
    pointLogListP2.clear();
    pointLogListP1.add("0");
    pointLogListP2.add("0");
    lastCounterOfGameListP1.clear();
    lastCounterOfGameListP2.clear();
  }

  void addOrderOfPlay(int player){  // 어떤 Player가 득점했는지에 대한 로그 추가
    orderOfPlay.add(player);
  }

  void removeOrderOfPlay(){ // 마지막 득점 로그 지우기
    orderOfPlay.removeLast();
  }
  
  void saveLastCounterOfGame(int counter1, int counter2){
    lastCounterOfGameListP1.add(counter1);
    lastCounterOfGameListP2.add(counter2);
  }
  
  void removeLastCounterOfGame(){
    lastCounterOfGameListP1.removeLast();
    lastCounterOfGameListP2.removeLast();
  }

  void incrementCounterP1(){  // Player1 득점
    setState(() {
      counterP1++;
      if(counterP1 == 4){     // 득점 및 '게임' 승리
        saveLastCounterOfGame(counterP1, counterP2);
        counterP1 = 0;
        counterP2 = 0;
        gameCounterP1++;
        addOrderOfPlay(1);
        addPointToLogP1(counterP1);
        addPointToLogP2(counterP2);
      }else{                  // '게임' 진행 중 득점
        addOrderOfPlay(1);  
        addPointToLogP1(counterP1);
        addPointToLogP2(counterP2);
      }
    });
  }

  void incrementCounterP2(){  // Player2 득점
    setState((){
      counterP2++;
      if(counterP2 == 4){     // 득점 및 '게임' 승리
        saveLastCounterOfGame(counterP1, counterP2);
        counterP1 = 0;
        counterP2 = 0;
        gameCounterP2++;
        addOrderOfPlay(2);
        addPointToLogP1(counterP1);
        addPointToLogP2(counterP2);
      }else{                  // '게임' 진행 중 득점
        addOrderOfPlay(2);  
        addPointToLogP1(counterP1);
        addPointToLogP2(counterP2);
      }
    });
  }

  void undoPoint(){ // 1 '포인트' 되돌리기
    setState((){
      removeLog();
      if(orderOfPlay.last == 1){
        if(gameCounterP1 > 0 && counterP1 == counterP2 && counterP1 == 0){
          gameCounterP1--;
          counterP1 = lastCounterOfGameListP1.last;
          counterP2 = lastCounterOfGameListP2.last;
          removeLastCounterOfGame();
        }else{
          counterP1--;  
        }
      }else{
        if(gameCounterP2 > 0 && counterP1 == counterP2 && counterP1 == 0){
          gameCounterP2--;
          counterP1 = lastCounterOfGameListP1.last;
          counterP2 = lastCounterOfGameListP2.last;
          removeLastCounterOfGame();
        }else{
          counterP2--;  
        }
      }
      removeOrderOfPlay();
    });
  }

  void resetPoint(){  // 모든 점수 초기화
    setState((){
      counterP1 = 0;
      counterP2 = 0;
      gameCounterP1 = 0;
      gameCounterP2 = 0;
      resetGameLog();
      Navigator.pop(context);
    });
  }


  void resetDialog() {  // 'All Reset' Dialog 알림
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            //Dialog Main Title
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Reset Match?"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "By clicking yes, the match will reset to 0-0",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Text('Ok'),
                onPressed: resetPoint, // reset
              ),
            ],
          );
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                  numeric: false,
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
                    DataCell(Text("Player1")),
                    DataCell(Text("$gameCounterP1")),
                    DataCell(Text(currentPointP1())),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('')),
                    DataCell(Text("Player2")),
                    DataCell(Text("$gameCounterP2")),
                    DataCell(Text(currentPointP2())),
                  ],
                ),
              ],
            ),
            Container(    // Information 탭
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
                    child: ListTile())),
            Container(
              // Score
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
              // Score 표시되는 부분
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        currentPointP1(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    )),
                Flexible(
                  //fit: FlexFit.loose,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24, 0.0, 24, 8),
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
                        currentPointP2(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    )),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 32, 16, 0.0),
                  child: FloatingActionButton.extended(
                      onPressed: incrementCounterP1,
                      tooltip: 'Player 1 gets point',
                      icon: Icon(Icons.add),
                      label: Text("Player 1")),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 32, 0.0, 0.0),
                  child: FloatingActionButton.extended(
                    onPressed: incrementCounterP2,
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
                )),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(32, 16, 32, 0.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Text(
                  'All Reset',
                ),
                onPressed: resetDialog,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
