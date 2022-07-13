class ScoreboardComponents{

  List<String> scoreList = ["0", "15", "30", "40"]; // 듀스 미포함'포인트' 리스트

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

  String player1Name = "Player1";
  String player2Name = "Player2";

  void addPointToLogP1(int counter) {
    // Player1 포인트 로그 리스트에 '포인트' 추가
    pointLogListP1.add(scoreList[counter]);
  }

  void addPointToLogP2(int counter) {
    // Player2 포인트 로그 리스트에 '포인트' 추가
    pointLogListP2.add(scoreList[counter]);
  }

  int gameCounterForP1(){
    return gameCounterP1;
  }

  int gameCounterForP2(){
    return gameCounterP2;
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

  NoDeuceGame ndc = NoDeuceGame();

  int gameLengthInUse(){
    return ndc.gameLength();
  }

}

class NoDeuceGame{

  int _gameLength = 6;

  int gameLength(){
    return _gameLength;
  }

  void setGameLength(int givenGameLength){
    _gameLength = givenGameLength;
  }

}