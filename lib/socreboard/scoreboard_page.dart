import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_score_system/socreboard/scoreboard_components.dart';

void koreanStandardNodeuce() => runApp(const KoreanStandardNodeucePage());

class KoreanStandardNodeucePage extends StatelessWidget {

  const KoreanStandardNodeucePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Score System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Game Start!'),
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

  ScoreboardComponents sc = ScoreboardComponents();

  void _setLastCounterOfGameListP1Data(List<int> intList) async{
    var key = 'lastCounterOfGameP1';
    List<String> strList = intList.map((i) => i.toString()).toList();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, strList);
  }

  void _loadLastCounterOfGameListP1Data() async{
    var key = 'lastCounterOfGameP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var strList = pref.getStringList(key);
      if(strList == null){
        sc.lastCounterOfGameListP1 == [];
      }
      else{
        sc.lastCounterOfGameListP1 = strList.map(int.parse).toList();
      }
    });
  }

  void _setLastCounterOfGameListP2Data(List<int> intList) async{
    var key = 'lastCounterOfGameP2';
    List<String> strList = intList.map((i) => i.toString()).toList();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, strList);
  }

  void _loadLastCounterOfGameListP2Data() async{
    var key = 'lastCounterOfGameP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var strList = pref.getStringList(key);
      if(strList == null){
        sc.lastCounterOfGameListP2 == [];
      }
      else{
        sc.lastCounterOfGameListP2 = strList.map(int.parse).toList();
      }
    });
  }

  void _setOrderOfPlayListData(List<int> intList) async{
    var key = 'orderOfPlay';
    List<String> strList = intList.map((i) => i.toString()).toList();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, strList);
  }

  void _loadOrderOfPlayListData() async{
    var key = 'orderOfPlay';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var strList = pref.getStringList(key);
      if(strList == null){
        sc.orderOfPlay == [];
      }
      else{
        sc.orderOfPlay = strList.map(int.parse).toList();
      }
    });
  }

  void _setPointLogListP1Data(List<String> list) async{
    var key = 'pointListP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, list);
  }

  void _setPointLogListP2Data(List<String> list) async{
    var key = 'pointListP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, list);
  }

  void _loadPointLogListP1Data() async{
    var key = 'pointListP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var list = pref.getStringList(key);
      if(list == null){
        sc.pointLogListP1 = ["0"];
      }
      else{
        sc.pointLogListP1 = list;
      }
    });
  }

  void _loadPointLogListP2Data() async{
    var key = 'pointListP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var list = pref.getStringList(key);
      if(list == null){
        sc.pointLogListP2 = ["0"];
      }
      else{
        sc.pointLogListP2 = list;
      }
    });
  }

  void _setTieBreakCounterP1Data(int value) async{
    var key = 'tieBreakCounterP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _setTieBreakCounterP2Data(int value) async{
    var key = 'tieBreakCounterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _loadTieBreakCounterP1Data() async{
    var key = 'tieBreakCounterP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.tieBreakCounterP1 = 0;
      }
      else{
        sc.tieBreakCounterP1 = value;
      }
    });
  }

  void _setCounterP1Data(int value) async{
    var key = 'counterP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _setCounterP2Data(int value) async{
    var key = 'counterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _loadCounterP1Data() async{
    var key = 'counterP1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.counterP1 = 0;
      }
      else{
        sc.counterP1 = value;
      }
    });
  }

  void _loadCounterP2Data() async{
    var key = 'counterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.counterP2 = 0;
      }
      else{
        sc.counterP2 = value;
      }
    });
  }

  void _loadTieBreakCounterP2Data() async{
    var key = 'tieBreakCounterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.tieBreakCounterP2 = 0;
      }
      else{
        sc.tieBreakCounterP2 = value;
      }
    });
  }

  void _setPlayer1NameData(String value) async {
    var key = 'name1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  void _setPlayer2NameData(String value) async {
    var key = 'name2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  void _setPlayer1GameCounterData(int value) async{
    var key = 'gameCounter1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _setPlayer2GameCounterData(int value) async{
    var key = 'gameCounter2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _loadPlayer1NameData() async{
    var key = 'name1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getString(key);
      if(value == null){
        setPlayer1Name("Player1");
      }
      else{
        setPlayer1Name(value);
      }
    });
  }

  void _loadPlayer2NameData() async{
    var key = 'name2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getString(key);
      if(value == null){
        setPlayer2Name("Player2");
      }
      else{
        setPlayer2Name(value);
      }
    });
  }

  void _loadPlayer1GameCounterData() async{
    var key = 'gameCounter1';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.gameCounterP1 = 0;
      }
      else{
        sc.gameCounterP1 = value;
      }
    });
  }

  void _loadPlayer2GameCounterData() async{
    var key = 'gameCounter2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        sc.gameCounterP2 = 0;
      }
      else{
        sc.gameCounterP2 = value;
      }
    });
  }

  @override
  void initState(){
    super.initState();
    _loadPlayer1GameCounterData();
    _loadPlayer1NameData();
    _loadPlayer2GameCounterData();
    _loadPlayer2NameData();
    _loadPointLogListP1Data();
    _loadPointLogListP2Data();
    _loadTieBreakCounterP1Data();
    _loadTieBreakCounterP2Data();
    _loadOrderOfPlayListData();
    _loadLastCounterOfGameListP1Data();
    _loadLastCounterOfGameListP2Data();
    _loadCounterP1Data();
    _loadCounterP2Data();
  }

  void _setLastDataAfterAction(){
    _setCounterP1Data(sc.counterP1);
    _setCounterP2Data(sc.counterP2);
    _setLastCounterOfGameListP1Data(sc.lastCounterOfGameListP1);
    _setLastCounterOfGameListP2Data(sc.lastCounterOfGameListP2);
    _setOrderOfPlayListData(sc.orderOfPlay);
    _setPlayer1GameCounterData(sc.gameCounterP1);
    _setPlayer1NameData(sc.player1Name);
    _setPlayer2GameCounterData(sc.gameCounterP2);
    _setPlayer2NameData(sc.player2Name);
    _setPointLogListP1Data(sc.pointLogListP1);
    _setPointLogListP2Data(sc.pointLogListP2);
    _setTieBreakCounterP1Data(sc.tieBreakCounterP1);
    _setTieBreakCounterP2Data(sc.tieBreakCounterP2);
  }

  String player1(){
    return sc.player1Name;
  }
  void setPlayer1Name(String newName){
    setState(() {
      sc.player1Name = newName;
      _setPlayer1NameData(sc.player1Name);
    });
  }

  String player2(){
    return sc.player2Name;
  }
  void setPlayer2Name(String newName){
    setState(() {
      sc.player2Name = newName;
      _setPlayer2NameData(sc.player2Name);
    });
  }

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose(){
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  void setDefaultName() {
    setState(() {
      setPlayer1Name("Player1");
      setPlayer2Name("Player2");
      _setLastDataAfterAction();
    });
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

  bool tieBreakServe(){
    if((sc.tieBreakCounterP1+sc.tieBreakCounterP2)%4 == 0 || (sc.tieBreakCounterP1+sc.tieBreakCounterP2)%4 == 3){
      return true;
    }
    else{
      return false;
    }
  }

  bool normalServe(){
    if((sc.gameCounterP1+sc.gameCounterP2)%2 == 1){
      return false;
    }
    else{
      return true;
    }
  }

  bool turnToServe(){
    if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
      return tieBreakServe();
    }
    else{
      return normalServe();
    }
  }

  void incrementCounterP1() {
    // Player1 득점
    setState(() {
      if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
        //타이브레이크 일 때
        if(sc.tieBreakCounterP1 >= 6 && sc.tieBreakCounterP2 >= 6){
          //타이브레이크 듀스일때
          if((sc.tieBreakCounterP1-sc.tieBreakCounterP2) >= 1){
            //타이브레이크 듀스 종료
            sc.tieBreakCounterP1++;
            sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
            sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
            sc.addOrderOfPlay(1);
            sc.gameCounterP1++;
            if(isMatchOver(sc.gameCounterP1)){
              //타이브레이크 종료 후 플레이어1 승리
              sc.pointLogListP1.add("Win");
              sc.pointLogListP2.add("Lose");
              matchOverDialog(player1());
            }
          }
          else{
            //듀스 또는 애드 상황
            sc.tieBreakCounterP1++;
            sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
            sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
            sc.addOrderOfPlay(1);
          }
        }
        else{
          //타이브레이크 듀스 아닐 때
          sc.tieBreakCounterP1++;
          sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
          sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
          sc.addOrderOfPlay(1);
          if(isTieBreakOver(sc.tieBreakCounterP1)){
            //타이브레이크 종료 되었는지 확인
            sc.gameCounterP1++;
            if(isMatchOver(sc.gameCounterP1)){
              //타이브레이크 종료로 인해 플레이어2 승리
              sc.pointLogListP1.add("Win");
              sc.pointLogListP2.add("Lose");
              matchOverDialog(player1());
            }
          }
        }
      }else{
        // 타이브레이크 아닐 때
        sc.counterP1++;
        if (sc.counterP1 == 4) {
          // 득점 및 '게임' 승리
          sc.counterP1--;
          sc.saveLastCounterOfGame(sc.counterP1, sc.counterP2);
          sc.counterP1 = 0;
          sc.counterP2 = 0;
          sc.gameCounterP1++;
          sc.addOrderOfPlay(1);
          sc.addPointToLogP1(sc.counterP1);
          sc.addPointToLogP2(sc.counterP2);
          if(isMatchOver(sc.gameCounterP1)){
            // 타이브레이크 아니고 플레이어1이 승리
            sc.pointLogListP1.add("Win");
            sc.pointLogListP2.add("Lose");
            matchOverDialog(player1());
          }
        } else {
          // '게임' 진행 중 득점
          sc.addOrderOfPlay(1);
          sc.addPointToLogP1(sc.counterP1);
          sc.addPointToLogP2(sc.counterP2);
        }
      }
      _setLastDataAfterAction();
    });
  }

  void incrementCounterP2() {
    // Player2 득점
    setState(() {
      if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
        // 타이브레이크 일 때
        if(sc.tieBreakCounterP1 >= 6 && sc.tieBreakCounterP2 >= 6){
          //타이브레이크 듀스일때
          if((sc.tieBreakCounterP2-sc.tieBreakCounterP1) >= 1){
            //타이브레이크 듀스 종료
            sc.tieBreakCounterP2++;
            sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
            sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
            sc.addOrderOfPlay(2);
            sc.gameCounterP2++;
            if(isMatchOver(sc.gameCounterP2)){
              //타이브레이크 종료 후 플레이어2 승리
              sc.pointLogListP2.add("Win");
              sc.pointLogListP1.add("Lose");
              matchOverDialog(player2());
            }
          }
          else{
            //듀스 또는 애드 상황
            sc.tieBreakCounterP2++;
            sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
            sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
            sc.addOrderOfPlay(2);
          }
        }
        else{
          //타이브레이크 때 그냥 득점
          sc.tieBreakCounterP2++;
          sc.pointLogListP1.add(sc.tieBreakCounterP1.toString());
          sc.pointLogListP2.add(sc.tieBreakCounterP2.toString());
          sc.addOrderOfPlay(2);
          if(isTieBreakOver(sc.tieBreakCounterP2)){
            //타이브레이크가 종료 되었는지 확인
            sc.gameCounterP2++;
            if(isMatchOver(sc.gameCounterP2)){
              //타이브레이크 종료로 인해 플레이어2 승리
              sc.pointLogListP2.add("Win");
              sc.pointLogListP1.add("Lose");
              matchOverDialog(player2());
            }
          }
        }
      }else{
        //타이브레이크 아닐 때
        sc.counterP2++;
        if (sc.counterP2 == 4) {
          // 득점 및 '게임' 승리
          sc.counterP2--;
          sc.saveLastCounterOfGame(sc.counterP1, sc.counterP2);
          sc.counterP1 = 0;
          sc.counterP2 = 0;
          sc.gameCounterP2++;
          sc.addOrderOfPlay(2);
          sc.addPointToLogP1(sc.counterP1);
          sc.addPointToLogP2(sc.counterP2);
          if(isMatchOver(sc.gameCounterP2)){
            //타이브레이크 아니고 플레이어2 승리
            sc.pointLogListP2.add("Win");
            sc.pointLogListP1.add("Lose");
            matchOverDialog(player2());
          }
        } else {
          // '게임' 진행 중 득점
          sc.addOrderOfPlay(2);
          sc.addPointToLogP1(sc.counterP1);
          sc.addPointToLogP2(sc.counterP2);
        }
      }
      _setLastDataAfterAction();
    });
  }

  void undoPoint() {
    // 1 '포인트' 되돌리기
    setState(() {
      if (sc.orderOfPlay.last == 1) {
        // 마지막 득점자가 플레이어1 일 때
        if(isMatchOver(sc.gameCounterP1)){
          // 매치 종료시 undo 실행
          sc.gameCounterP1--;
          sc.removeLog();
          if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
            // 타이브레이크 진행 이후 Match Over였을 때
            sc.tieBreakCounterP1--;
          }
          else{
            // 일반 게임 이후 Match Over였을 때
            sc.counterP1 = sc.lastCounterOfGameListP1.last;
            sc.counterP2 = sc.lastCounterOfGameListP2.last;
            sc.removeLastCounterOfGame();
          }
          sc.removeLog();
        }
        else{
          if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
            // 타이브레이크에서 undo 실행 시
            if(sc.gameCounterP1 == 5 && sc.tieBreakCounterP1 == sc.tieBreakCounterP2 && sc.tieBreakCounterP1 == 0){
              // 타이브레이크 0:0 상황 시 undo
              sc.gameCounterP1--;
              sc.counterP1 = sc.lastCounterOfGameListP1.last;
              sc.counterP2 = sc.lastCounterOfGameListP2.last;
              sc.removeLastCounterOfGame();
            }
            else{
              // 일반 타이브레이크 시 undo
              sc.tieBreakCounterP1--;
            }
            sc.removeLog();
          }
          else{
            // 일반 상황에서 undo 실행 시
            if(sc.gameCounterP1 > 0 && sc.counterP1 == sc.counterP2 && sc.counterP1 == 0){
              // 일반 상황 0:0 에서 undo
              sc.gameCounterP1--;
              sc.counterP1 = sc.lastCounterOfGameListP1.last;
              sc.counterP2 = sc.lastCounterOfGameListP2.last;
              sc.removeLastCounterOfGame();
            }
            else{
              // 일반 상황에서 undo
              sc.counterP1--;
            }
            sc.removeLog();
          }
        }
        sc.removeOrderOfPlay();
      } else if (sc.orderOfPlay.last == 2) {
        //플레이어2가 마지막 득점자 일 떄
        if(isMatchOver(sc.gameCounterP2)){
          // 매치 종료시 undo 실행
          sc.gameCounterP2--;
          sc.removeLog();
          if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
            // 타이브레이크 진행 이후 Match Over였을 때
            sc.tieBreakCounterP2--;
          }
          else{
            // 일반 게임 이후 Match Over였을 때
            sc.counterP1 = sc.lastCounterOfGameListP1.last;
            sc.counterP2 = sc.lastCounterOfGameListP2.last;
            sc.removeLastCounterOfGame();
          }
          sc.removeLog();
        }
        else{
          if(isTieBreak(sc.gameCounterP1, sc.gameCounterP2)){
            // 타이브레이크에서 undo 실행 시
            if(sc.gameCounterP2 == 5 && sc.tieBreakCounterP1 == sc.tieBreakCounterP2 && sc.tieBreakCounterP1 == 0){
              // 타이브레이크 0:0 상황 시 undo
              sc.gameCounterP2--;
              sc.counterP1 = sc.lastCounterOfGameListP1.last;
              sc.counterP2 = sc.lastCounterOfGameListP2.last;
              sc.removeLastCounterOfGame();
            }
            else{
              // 일반 타이브레이크 시 undo
              sc.tieBreakCounterP2--;
            }
            sc.removeLog();
          }
          else{
            // 일반 상황에서 undo 실행 시
            if(sc.gameCounterP2 > 0 && sc.counterP1 == sc.counterP2 && sc.counterP1 == 0){
              // 일반 상황 0:0 에서 undo
              sc.gameCounterP2--;
              sc.counterP1 = sc.lastCounterOfGameListP1.last;
              sc.counterP2 = sc.lastCounterOfGameListP2.last;
              sc.removeLastCounterOfGame();
            }
            else{
              // 일반 상황에서 undo
              sc.counterP2--;
            }
            sc.removeLog();
          }
        }
        sc.removeOrderOfPlay();
      }
      else{
        resetPoint();
      }
      _setLastDataAfterAction();
    });
  }

  void resetPoint() {
    // 모든 점수 초기화
    setState(() {
      sc.counterP1 = 0;
      sc.counterP2 = 0;
      sc.gameCounterP1 = 0;
      sc.gameCounterP2 = 0;
      sc.resetGameLog();
      setDefaultName();
      _setLastDataAfterAction();
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
                const Text("Reset Match?"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "By clicking yes, the match will reset to 0-0",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: const Text('Ok'),
                  onPressed: (){
                    Navigator.pop(context);
                    resetPoint();
                  }
              ),
            ],
          );
        });
  }

  void matchOverDialog(String player) {
    // 게임 종료시 Dialog 알림
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
                Text(player+" Win!!"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
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
                  child: const Text('Reset'),
                  onPressed: (){
                    Navigator.pop(context);
                    resetPoint();
                  }),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text('Undo'),
                onPressed: () {
                  undoPoint();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void setPlayerNameDiaglog() {
    // 게임 종료시 Dialog 알림

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
                const Text("Set Names for both Players"),
                TextField(
                  controller: myController1,
                  decoration: const InputDecoration(
                    labelText: "Player1",
                    hintText: "Enter Player1's Name",
                  ),
                ),
                TextField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    labelText: "Player2",
                    hintText: "Enter Player2's Name",
                  ),
                )
              ],
            ),
            //
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text('Set Default'),
                  onPressed: (){
                    Navigator.pop(context);
                    setDefaultName();
                  }),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text('Okay'),
                onPressed: () {
                  setPlayer1Name(myController1.text);
                  setPlayer2Name(myController2.text);
                  Navigator.pop(context);
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
          const TextStyle(
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
                    DataCell(
                        Visibility(
                          child: const Icon(Icons.sports_tennis),
                          visible: turnToServe(),
                        )),
                    DataCell(Text(player1())),
                    DataCell(Text("$sc.gameCounterP1")),
                    DataCell(Text(sc.currentPointP1())),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                        Visibility(
                          child: const Icon(Icons.sports_tennis),
                          visible: !turnToServe(),
                        )),
                    DataCell(Text(player2())),
                    DataCell(Text("$sc.gameCounterP2")),
                    DataCell(Text(sc.currentPointP2())),
                  ],
                ),
              ],
            ),
            Container(
              // Information 탭
              margin: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
              child: const Text(
                'Information',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16),
                child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const ListTile())),
            Container(
              // Score
              margin: const EdgeInsets.fromLTRB(0.0, 8, 0.0, 16),
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
                        sc.currentPointP1(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    )),
                Flexible(
                  //fit: FlexFit.loose,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(24, 0.0, 24, 8),
                      child: const Text(
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
                        sc.currentPointP2(),
                        style: const TextStyle(
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
                  margin: const EdgeInsets.fromLTRB(0.0, 24, 16, 0.0),
                  child: FloatingActionButton.extended(
                      onPressed: incrementCounterP1,
                      tooltip: 'Player 1 gets point',
                      icon: const Icon(Icons.add),
                      label: Text(player1())),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 24, 0.0, 0.0),
                  child: FloatingActionButton.extended(
                    onPressed: incrementCounterP2,
                    tooltip: 'Player 2 gets point',
                    icon: const Icon(Icons.add),
                    label: Text(player2()),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.all(16),
                child: FloatingActionButton.extended(
                  onPressed: undoPoint,
                  elevation: 0.0,
                  backgroundColor: Colors.grey,
                  label: const Icon(Icons.undo),
                )),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.fromLTRB(32, 16, 32, 0.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text(
                  'Set Player Name',
                ),
                onPressed: setPlayerNameDiaglog,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.fromLTRB(32, 16, 32, 0.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text(
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