import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_score_system/match_and_scoreboard/noDeuce_singleSet_game.dart';
import 'package:tennis_score_system/socreboard/scoreboard_components.dart';
import 'package:tennis_score_system/main.dart';

void singleSetScoreboardPage() => runApp(const SingleSetScoreboardPage());

class SingleSetScoreboardPage extends StatelessWidget {

  const SingleSetScoreboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page for Single Set Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SingleSetScoreboardPageBuild(title: 'Game Start!'),
    );
  }
}

class SingleSetScoreboardPageBuild extends StatefulWidget {

  const SingleSetScoreboardPageBuild({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SingleSetScoreboardPageBuild> createState() => _SingleSetScoreboardPageBuildState();
}

class _SingleSetScoreboardPageBuildState extends State<SingleSetScoreboardPageBuild> {

  NoDeuceSingleSetGame noDeuceSingleSetGame = NoDeuceSingleSetGame();

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
        noDeuceSingleSetGame.scoreComponents.lastCounterOfGameListP1() == [];
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setLastCounterOfGameListP1(strList.map(int.parse).toList());
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
        noDeuceSingleSetGame.scoreComponents.lastCounterOfGameListP2() == [];
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setLastCounterOfGameListP2(strList.map(int.parse).toList());
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
        noDeuceSingleSetGame.scoreComponents.orderOfPlay() == [];
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setOderOfPlay(strList.map(int.parse).toList());
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
        noDeuceSingleSetGame.scoreComponents.pointLogListP1() == ["0"];
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setPointLogListP1(list);
      }
    });
  }

  void _loadPointLogListP2Data() async{
    var key = 'pointListP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var list = pref.getStringList(key);
      if(list == null){
        noDeuceSingleSetGame.scoreComponents.pointLogListP2() == ["0"];
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setPointLogListP2(list);
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
        noDeuceSingleSetGame.scoreComponents.setTieBreakCounterP1(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setTieBreakCounterP1(value);
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
        noDeuceSingleSetGame.scoreComponents.setCounterP1(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setCounterP1(value);
      }
    });
  }

  void _loadCounterP2Data() async{
    var key = 'counterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        noDeuceSingleSetGame.scoreComponents.setCounterP2(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setCounterP2(value);
      }
    });
  }

  void _loadTieBreakCounterP2Data() async{
    var key = 'tieBreakCounterP2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        noDeuceSingleSetGame.scoreComponents.setTieBreakCounterP2(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setTieBreakCounterP2(value);
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
        noDeuceSingleSetGame.scoreComponents.setGameCounterP1(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setGameCounterP1(value);
      }
    });
  }

  void _loadPlayer2GameCounterData() async{
    var key = 'gameCounter2';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        noDeuceSingleSetGame.scoreComponents.setGameCounterP2(0);
      }
      else{
        noDeuceSingleSetGame.scoreComponents.setGameCounterP2(value);
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
    _setCounterP1Data(noDeuceSingleSetGame.scoreComponents.counterP1());
    _setCounterP2Data(noDeuceSingleSetGame.scoreComponents.counterP2());
    _setLastCounterOfGameListP1Data(noDeuceSingleSetGame.scoreComponents.lastCounterOfGameListP1());
    _setLastCounterOfGameListP2Data(noDeuceSingleSetGame.scoreComponents.lastCounterOfGameListP2());
    _setOrderOfPlayListData(noDeuceSingleSetGame.scoreComponents.orderOfPlay());
    _setPlayer1GameCounterData(noDeuceSingleSetGame.scoreComponents.gameCounterP1());
    _setPlayer1NameData(noDeuceSingleSetGame.player1Name());
    _setPlayer2GameCounterData(noDeuceSingleSetGame.scoreComponents.gameCounterP2());
    _setPlayer2NameData(noDeuceSingleSetGame.player2Name());
    _setPointLogListP1Data(noDeuceSingleSetGame.scoreComponents.pointLogListP1());
    _setPointLogListP2Data(noDeuceSingleSetGame.scoreComponents.pointLogListP2());
    _setTieBreakCounterP1Data(noDeuceSingleSetGame.scoreComponents.tieBreakCounterP1());
    _setTieBreakCounterP2Data(noDeuceSingleSetGame.scoreComponents.tieBreakCounterP2());
  }
  void setPlayer1Name(String newName){
    setState(() {
      noDeuceSingleSetGame.setPlayer1Name(newName);
    });
  }

  void setPlayer2Name(String newName){
    setState(() {
      noDeuceSingleSetGame.setPlayer2Name(newName);
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

  bool tieBreakServe(){
    if((noDeuceSingleSetGame.scoreComponents.tieBreakCounterP1()+noDeuceSingleSetGame.scoreComponents.tieBreakCounterP2())%4 == 0 || (noDeuceSingleSetGame.scoreComponents.tieBreakCounterP1()+noDeuceSingleSetGame.scoreComponents.tieBreakCounterP2())%4 == 3){
      return true;
    }
    else{
      return false;
    }
  }

  bool normalServe(){
    if((noDeuceSingleSetGame.scoreComponents.gameCounterP1()+noDeuceSingleSetGame.scoreComponents.gameCounterP2())%2 == 1){
      return false;
    }
    else{
      return true;
    }
  }

  bool turnToServe(){
    if(noDeuceSingleSetGame.isTieBreak(noDeuceSingleSetGame.scoreComponents.gameCounterP1(), noDeuceSingleSetGame.scoreComponents.gameCounterP2())){
      return tieBreakServe();
    }
    else{
      return normalServe();
    }
  }

  void incrementButtonP1(){
    setState((){
      noDeuceSingleSetGame.incrementPointP1();
      _setLastDataAfterAction();
    });
  }

  void incrementButtonP2(){
    setState((){
      noDeuceSingleSetGame.incrementPointP2();
      _setLastDataAfterAction();
    });
  }

  void undoPointButton(){
    setState((){
      noDeuceSingleSetGame.undoPoint();
      _setLastDataAfterAction();
    });
  }

  void resetPointButton() {
    // 모든 점수 초기화
    setState(() {
      noDeuceSingleSetGame.scoreComponents.resetPoint();
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
                    resetPointButton();
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
                    resetPointButton();
                  }),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text('Undo'),
                onPressed: () {
                  undoPointButton();
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
                    DataCell(Text(noDeuceSingleSetGame.player1Name())),
                    DataCell(Text(noDeuceSingleSetGame.scoreComponents.gameCounterP1().toString())),
                    DataCell(Text(noDeuceSingleSetGame.scoreComponents.currentPointP1())),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                        Visibility(
                          child: const Icon(Icons.sports_tennis),
                          visible: !turnToServe(),
                        )),
                    DataCell(Text(noDeuceSingleSetGame.player2Name())),
                    DataCell(Text(noDeuceSingleSetGame.scoreComponents.gameCounterP2().toString())),
                    DataCell(Text(noDeuceSingleSetGame.scoreComponents.currentPointP2())),
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
                        noDeuceSingleSetGame.scoreComponents.currentPointP1(),
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
                        noDeuceSingleSetGame.scoreComponents.currentPointP2(),
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
                      onPressed: incrementButtonP1,
                      tooltip: 'Player 1 gets point',
                      icon: const Icon(Icons.add),
                      label: Text(noDeuceSingleSetGame.player1Name())),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 24, 0.0, 0.0),
                  child: FloatingActionButton.extended(
                    onPressed: incrementButtonP2,
                    tooltip: 'Player 2 gets point',
                    icon: const Icon(Icons.add),
                    label: Text(noDeuceSingleSetGame.player2Name()),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.all(16),
                child: FloatingActionButton.extended(
                  onPressed: undoPointButton,
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