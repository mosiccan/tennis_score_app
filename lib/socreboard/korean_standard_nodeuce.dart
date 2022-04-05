import 'package:flutter/material.dart';
import 'dart:collection';

void korean_stadard_nodeuce() => runApp(korean_stadard_nodeuce_page());

class korean_stadard_nodeuce_page extends StatelessWidget {
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

  List<String> pointLogListP1 = ["0"]; // Player1의 포인트 로그 리스트
  List<String> pointLogListP2 = ["0"]; // Player2의 포인트 로그 리스트

  List<int> orderOfPlay = []; // 득점순서 기록용 리스트

  List<int> lastCounterOfGameListP1 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장
  List<int> lastCounterOfGameListP2 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장

  int counterP1 = 0; // Player1의 '포인트' 지정 변수
  int counterP2 = 0; // Player2의 '포인트' 지정 변수

  int gameCounterP1 = 0; // Player1의 '게임' 스코어 지정 변수
  int gameCounterP2 = 0; // Player2의 '게임' 스코어 지정 변수

  int tieBreakCounterP1 = 0;    //Player1의 타이브레이크 진행 시 사용하는 카운터
  int tieBreakCounterP2 = 0;    //Player2의 타이브레이크 진행 시 사용하는 카운터

  void addPointToLogP1(int counter) {
    // Player1 포인트 로그 리스트에 '포인트' 추가
    pointLogListP1.add(scoreList[counter]);
  }

  void addPointToLogP2(int counter) {
    // Player2 포인트 로그 리스트에 '포인트' 추가
    pointLogListP2.add(scoreList[counter]);
  }

  String currentPointP1() {
    // Player1의 현재 '포인트' 반환
    return pointLogListP1.last;
  }

  String currentPointP2() {
    // Player2의 현재 '포인트' 반환
    return pointLogListP2.last;
  }

  void removeLog() {
    // 모든 Player의 마지막 포인트 로그 제거
    pointLogListP1.removeLast();
    pointLogListP2.removeLast();
  }

  void resetGameLog() {
    // 모든 게임 '로그' 초기화 "All Reset"
    pointLogListP1.clear();
    pointLogListP2.clear();
    pointLogListP1.add("0");
    pointLogListP2.add("0");
    lastCounterOfGameListP1.clear();
    lastCounterOfGameListP2.clear();
    tieBreakCounterP1 = 0;
    tieBreakCounterP2 = 0;
    orderOfPlay.clear();
  }

  void addOrderOfPlay(int player) {
    // 어떤 Player가 득점했는지에 대한 로그 추가
    orderOfPlay.add(player);
  }

  void removeOrderOfPlay() {
    // 마지막 득점 로그 지우기
    orderOfPlay.removeLast();
  }

  void saveLastCounterOfGame(int counter1, int counter2) {
    lastCounterOfGameListP1.add(counter1);
    lastCounterOfGameListP2.add(counter2);
  }

  void removeLastCounterOfGame() {
    lastCounterOfGameListP1.removeLast();
    lastCounterOfGameListP2.removeLast();
  }

  bool isTieBreak(int counter1, int counter2){
    if(counter1 == counter2 && counter1 >= 5){
      return true;
    }
    return false;
  }

  bool isMatchOver(int counter){
    if(counter >= 6){
      return true;
    }
    return false;
  }

  bool isTieBreakOver(int counter){
    if(counter >= 7){
      return true;
    }
    return false;
  }

  void incrementCounterP1() {
    // Player1 득점
    setState(() {
      if(isTieBreak(gameCounterP1, gameCounterP2)){
        //타이브레이크 일 때
        if(tieBreakCounterP1 >= 6 && tieBreakCounterP2 >= 6){
          //타이브레이크 듀스일때
          if((tieBreakCounterP1-tieBreakCounterP2) >= 1){
            //타이브레이크 듀스 종료
            tieBreakCounterP1++;
            pointLogListP1.add(tieBreakCounterP1.toString());
            pointLogListP2.add(tieBreakCounterP2.toString());
            addOrderOfPlay(1);
            gameCounterP1++;
            if(isMatchOver(gameCounterP1)){
              //타이브레이크 종료 후 플레이어1 승리
              pointLogListP1.add("Win");
              pointLogListP2.add("Lose");
              matchOverDialog(1);
            }
          }
          else{
            //듀스 또는 애드 상황
            tieBreakCounterP1++;
            pointLogListP1.add(tieBreakCounterP1.toString());
            pointLogListP2.add(tieBreakCounterP2.toString());
            addOrderOfPlay(1);
          }
        }
        else{
          //타이브레이크 듀스 아닐 때
          tieBreakCounterP1++;
          pointLogListP1.add(tieBreakCounterP1.toString());
          pointLogListP2.add(tieBreakCounterP2.toString());
          addOrderOfPlay(1);
          if(isTieBreakOver(tieBreakCounterP1)){
            //타이브레이크 종료 되었는지 확인
            gameCounterP1++;
            if(isMatchOver(gameCounterP1)){
              //타이브레이크 종료로 인해 플레이어2 승리
              pointLogListP1.add("Win");
              pointLogListP2.add("Lose");
              matchOverDialog(1);
            }
          }
        }
      }else{
        // 타이브레이크 아닐 때
        counterP1++;
        if (counterP1 == 4) {
          // 득점 및 '게임' 승리
          counterP1--;
          saveLastCounterOfGame(counterP1, counterP2);
          counterP1 = 0;
          counterP2 = 0;
          gameCounterP1++;
          addOrderOfPlay(1);
          addPointToLogP1(counterP1);
          addPointToLogP2(counterP2);
          if(isMatchOver(gameCounterP1)){
            // 타이브레이크 아니고 플레이어1이 승리
            pointLogListP1.add("Win");
            pointLogListP2.add("Lose");
            matchOverDialog(1);
          }
        } else {
          // '게임' 진행 중 득점
          addOrderOfPlay(1);
          addPointToLogP1(counterP1);
          addPointToLogP2(counterP2);
        }
      }
    });
  }

  void incrementCounterP2() {
    // Player2 득점
    setState(() {
      if(isTieBreak(gameCounterP1, gameCounterP2)){
        // 타이브레이크 일 때
        if(tieBreakCounterP1 >= 6 && tieBreakCounterP2 >= 6){
          //타이브레이크 듀스일때
          if((tieBreakCounterP2-tieBreakCounterP1) >= 1){
            //타이브레이크 듀스 종료
            tieBreakCounterP2++;
            pointLogListP1.add(tieBreakCounterP1.toString());
            pointLogListP2.add(tieBreakCounterP2.toString());
            addOrderOfPlay(2);
            gameCounterP2++;
            if(isMatchOver(gameCounterP2)){
              //타이브레이크 종료 후 플레이어2 승리
              pointLogListP2.add("Win");
              pointLogListP1.add("Lose");
              matchOverDialog(2);
            }
          }
          else{
            //듀스 또는 애드 상황
            tieBreakCounterP2++;
            pointLogListP1.add(tieBreakCounterP1.toString());
            pointLogListP2.add(tieBreakCounterP2.toString());
            addOrderOfPlay(2);
          }
        }
        else{
          //타이브레이크 때 그냥 득점
          tieBreakCounterP2++;
          pointLogListP1.add(tieBreakCounterP1.toString());
          pointLogListP2.add(tieBreakCounterP2.toString());
          addOrderOfPlay(2);
          if(isTieBreakOver(tieBreakCounterP2)){
            //타이브레이크가 종료 되었는지 확인
            gameCounterP2++;
            if(isMatchOver(gameCounterP2)){
              //타이브레이크 종료로 인해 플레이어2 승리
              pointLogListP2.add("Win");
              pointLogListP1.add("Lose");
              matchOverDialog(2);
            }
          }
        }
      }else{
        //타이브레이크 아닐 때
        counterP2++;
        if (counterP2 == 4) {
          // 득점 및 '게임' 승리
          counterP2--;
          saveLastCounterOfGame(counterP1, counterP2);
          counterP1 = 0;
          counterP2 = 0;
          gameCounterP2++;
          addOrderOfPlay(2);
          addPointToLogP1(counterP1);
          addPointToLogP2(counterP2);
          if(isMatchOver(gameCounterP2)){
            //타이브레이크 아니고 플레이어2 승리
            pointLogListP2.add("Win");
            pointLogListP1.add("Lose");
            matchOverDialog(2);
          }
        } else {
          // '게임' 진행 중 득점
          addOrderOfPlay(2);
          addPointToLogP1(counterP1);
          addPointToLogP2(counterP2);
        }
      }
    });
  }

  void undoPoint() {
    // 1 '포인트' 되돌리기
    setState(() {
      if (orderOfPlay.last == 1) {
        // 마지막 득점자가 플레이어1 일 때
        if(isMatchOver(gameCounterP1)){
          // 매치 종료시 undo 실행
          gameCounterP1--;
          removeLog();
          if(isTieBreak(gameCounterP1, gameCounterP2)){
            // 타이브레이크 진행 이후 Match Over였을 때
            tieBreakCounterP1--;
          }
          else{
            // 일반 게임 이후 Match Over였을 때
            counterP1 = lastCounterOfGameListP1.last;
            counterP2 = lastCounterOfGameListP2.last;
            removeLastCounterOfGame();
          }
          Navigator.pop(context);
          removeLog();
        }
        else{
          if(isTieBreak(gameCounterP1, gameCounterP2)){
            // 타이브레이크에서 undo 실행 시
            if(gameCounterP1 == 5 && tieBreakCounterP1 == tieBreakCounterP2 && tieBreakCounterP1 == 0){
              // 타이브레이크 0:0 상황 시 undo
              gameCounterP1--;
              counterP1 = lastCounterOfGameListP1.last;
              counterP2 = lastCounterOfGameListP2.last;
              removeLastCounterOfGame();
            }
            else{
              // 일반 타이브레이크 시 undo
              tieBreakCounterP1--;
            }
            removeLog();
          }
          else{
            // 일반 상황에서 undo 실행 시
            if(gameCounterP1 > 0 && counterP1 == counterP2 && counterP1 == 0){
              // 일반 상황 0:0 에서 undo
              gameCounterP1--;
              counterP1 = lastCounterOfGameListP1.last;
              counterP2 = lastCounterOfGameListP2.last;
              removeLastCounterOfGame();
            }
            else{
              // 일반 상황에서 undo
              counterP1--;
            }
            removeLog();
          }
        }
      } else if (orderOfPlay.last == 2) {
        //플레이어2가 마지막 득점자 일 떄
        if(isMatchOver(gameCounterP2)){
          // 매치 종료시 undo 실행
          gameCounterP2--;
          removeLog();
          if(isTieBreak(gameCounterP1, gameCounterP2)){
            // 타이브레이크 진행 이후 Match Over였을 때
            tieBreakCounterP2--;
          }
          else{
            // 일반 게임 이후 Match Over였을 때
            counterP1 = lastCounterOfGameListP1.last;
            counterP2 = lastCounterOfGameListP2.last;
            removeLastCounterOfGame();
          }
          Navigator.pop(context);
          removeLog();
        }
        else{
          if(isTieBreak(gameCounterP1, gameCounterP2)){
            // 타이브레이크에서 undo 실행 시
            if(gameCounterP2 == 5 && tieBreakCounterP1 == tieBreakCounterP2 && tieBreakCounterP1 == 0){
              // 타이브레이크 0:0 상황 시 undo
              gameCounterP2--;
              counterP1 = lastCounterOfGameListP1.last;
              counterP2 = lastCounterOfGameListP2.last;
              removeLastCounterOfGame();
            }
            else{
              // 일반 타이브레이크 시 undo
              tieBreakCounterP2--;
            }
            removeLog();
          }
          else{
            // 일반 상황에서 undo 실행 시
            if(gameCounterP2 > 0 && counterP1 == counterP2 && counterP1 == 0){
              // 일반 상황 0:0 에서 undo
              gameCounterP2--;
              counterP1 = lastCounterOfGameListP1.last;
              counterP2 = lastCounterOfGameListP2.last;
              removeLastCounterOfGame();
            }
            else{
              // 일반 상황에서 undo
              counterP2--;
            }
            removeLog();
          }
        }
      }
      removeOrderOfPlay();
    });
  }

  void resetPoint() {
    // 모든 점수 초기화
    setState(() {
      counterP1 = 0;
      counterP2 = 0;
      gameCounterP1 = 0;
      gameCounterP2 = 0;
      resetGameLog();
      Navigator.pop(context);
    });
  }

  void resetDialog() {
    // 'All Reset' Dialog 알림
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

  void matchOverDialog(int player) {
    // 게임 종료시 Dialog 알림
    BuildContext dialogContext;
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            //Dialog Main Title
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Player $player Win!!"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "TBU",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text('Reset'),
                onPressed: resetPoint, // reset
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Text('Undo'),
                onPressed: () {
                  undoPoint();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.title,
          style:
          TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
            Container(
              // Information 탭
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
              margin: EdgeInsets.fromLTRB(0.0, 8, 0.0, 16),
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
                          fontSize: 48,
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
                          fontSize: 48,
                        ),
                      ),
                    )),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 24, 16, 0.0),
                  child: FloatingActionButton.extended(
                      onPressed: incrementCounterP1,
                      tooltip: 'Player 1 gets point',
                      icon: Icon(Icons.add),
                      label: Text("Player 1")),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 24, 0.0, 0.0),
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
            // Container(
            //   alignment: Alignment.bottomRight,
            //   margin: EdgeInsets.fromLTRB(32, 16, 32, 0.0),
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //       primary: Colors.grey,
            //     ),
            //     child: Text(
            //       'All Reset',
            //     ),
            //     onPressed: resetDialog,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}