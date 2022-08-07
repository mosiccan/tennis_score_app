class ScoreComponents{

  static List<String> _scoreList = ["0", "15", "30", "40"]; // 듀스 미포함'포인트' 리스트

  static List<String> _pointLogListP1 = ["0"]; // Player1의 포인트 로그 리스트
  static List<String> _pointLogListP2 = ["0"]; // Player2의 포인트 로그 리스트

  static List<int> _orderOfPlay = []; // 득점순서 기록용 리스트

  static List<int> _lastCounterOfGameListP1 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장
  static List<int> _lastCounterOfGameListP2 = []; // '게임' 득점 직전 CounterP1 및 CounterP2 저장

  static int _counterP1 = 0; // Player1의 '포인트' 지정 변수
  static int _counterP2 = 0; // Player2의 '포인트' 지정 변수

  static int _gameCounterP1 = 0; // Player1의 '게임' 스코어 지정 변수
  static int _gameCounterP2 = 0; // Player2의 '게임' 스코어 지정 변수

  static int _tieBreakCounterP1 = 0;    //Player1의 타이브레이크 진행 시 사용하는 카운터
  static int _tieBreakCounterP2 = 0;    //Player2의 타이브레이크 진행 시 사용하는 카운터

  //여기부터 getter 선언

  List<String> scoreList(){
    return _scoreList;
  }

  List<String> pointLogListP1(){
    return _pointLogListP1;
  }

  List<String> pointLogListP2(){
    return _pointLogListP2;
  }

  List<int> orderOfPlay(){
    return _orderOfPlay;
  }

  List<int> lastCounterOfGameListP1(){
    return _lastCounterOfGameListP1;
  }

  List<int> lastCounterOfGameListP2(){
    return _lastCounterOfGameListP2;
  }

  int counterP1(){
    return _counterP1;
  }

  int counterP2(){
    return _counterP2;
  }

  int gameCounterP1(){
    return _gameCounterP1;
  }

  int gameCounterP2(){
    return _gameCounterP2;
  }

  int tieBreakCounterP1(){
    return _tieBreakCounterP1;
  }

  int tieBreakCounterP2(){
    return _tieBreakCounterP2;
  }

  //getter 선언 끝
  // 여기서부터 setter 선언

  void setScoreList(List<String> newScoreList){
    _scoreList = newScoreList;
  }

  void setPointLogListP1(List<String> newPointLogListP1){
    _pointLogListP1 = newPointLogListP1;
  }

  void setPointLogListP2(List<String> newPointLogListP2){
    _pointLogListP2 = newPointLogListP2;
  }

  void setOderOfPlay(List<int> newOrderOfPlay){
    _orderOfPlay = newOrderOfPlay;
  }

  void setLastCounterOfGameListP1(List<int> newList){
    _lastCounterOfGameListP1 = newList;
  }

  void setLastCounterOfGameListP2(List<int> newList){
    _lastCounterOfGameListP2 = newList;
  }

  void setCounterP1(int newCounterP1){
    _counterP1 = newCounterP1;
  }

  void setCounterP2(int newCounterP2){
    _counterP2 = newCounterP2;
  }

  void setGameCounterP1(int newGameCounterP1){
    _gameCounterP1 = newGameCounterP1;
  }

  void setGameCounterP2(int newGameCounterP2){
    _gameCounterP2 = newGameCounterP2;
  }

  void setTieBreakCounterP1(int newTieBreakCounterP1){
    _tieBreakCounterP1 = newTieBreakCounterP1;
  }

  void setTieBreakCounterP2(int newTieBreakCounterP2){
    _tieBreakCounterP2 = newTieBreakCounterP2;
  }

  //setter 선언 끝

  void addPointToLogP1(int counter) {
    // Player1 포인트 로그 리스트에 '포인트' 추가
    pointLogListP1().add(scoreList()[counter]);
  }

  void addPointToLogP2(int counter) {
    // Player2 포인트 로그 리스트에 '포인트' 추가
    pointLogListP2().add(scoreList()[counter]);
  }

  String currentPointP1(){
    // Player1의 현재 '포인트' 반환
    return pointLogListP1().last;
  }

  String currentPointP2(){
    // Player2의 현재 '포인트' 반환
    return pointLogListP2().last;
  }

  void removeLog() {
    // 모든 Player의 마지막 포인트 로그 제거
    pointLogListP1().removeLast();
    pointLogListP2().removeLast();
  }

  void resetGameLog() {
    // 모든 게임 '로그' 초기화 "All Reset"
    pointLogListP1().clear();
    pointLogListP2().clear();
    pointLogListP1().add("0");
    pointLogListP2().add("0");
    lastCounterOfGameListP1().clear();
    lastCounterOfGameListP2().clear();
    setTieBreakCounterP1(0);
    setTieBreakCounterP2(0);
    orderOfPlay().clear();
  }

  void addOrderOfPlay(int player) {
    // 어떤 Player가 득점했는지에 대한 로그 추가
    orderOfPlay().add(player);
  }

  void removeOrderOfPlay() {
    // 마지막 득점 로그 지우기
    orderOfPlay().removeLast();
  }

  void saveLastCounterOfGame(int counter1, int counter2) {
    //다음 게임으로 넘어가기 전 마지막 점수 Counter를 저장시킨다
    lastCounterOfGameListP1().add(counter1);
    lastCounterOfGameListP2().add(counter2);
  }

  void removeLastCounterOfGame() {
    //undo를 실행 한 후 Counter를 지운다
    lastCounterOfGameListP1().removeLast();
    lastCounterOfGameListP2().removeLast();
  }

  void resetPoint(){
    setCounterP1(0);
    setCounterP2(0);
    setGameCounterP1(0);
    setGameCounterP2(0);
    resetGameLog();
  }

}