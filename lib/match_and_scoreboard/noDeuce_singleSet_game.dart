import 'package:tennis_score_system/match_and_scoreboard/score.dart';

class NoDeuceSingleSetGame{

  String _player1Name = "Player1";
  String _player2Name = "Player2";

  int _gameLength = 6;     //경기의 Game 수

  ScoreComponents scoreComponents = ScoreComponents();

  String player1Name(){
    return _player1Name;
  }

  String player2Name(){
    return _player2Name;
  }

  int gameLength(){
    return _gameLength;
  }

  void setPlayer1Name(String newName){
    _player1Name = newName;
  }

  void setPlayer2Name(String newName){
    _player2Name = newName;
  }

  void setGameLength(int newGameLength){
    _gameLength = newGameLength;
  }

  bool isTieBreak(int counter1, int counter2){
    if(counter1 == counter2 && counter1 >= (gameLength()-1)){
      return true;
    }
    return false;
  }

  bool isMatchOver(int counter){
    if(counter >= gameLength()){
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

  void incrementPointP1(){
    //Player1 득점 상황
    if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
      //타이브레이크 일 때
      if(scoreComponents.tieBreakCounterP1() >= 6 && scoreComponents.tieBreakCounterP2() >= 6){
        //타이브레이크 듀스일때
        if((scoreComponents.tieBreakCounterP1()-scoreComponents.tieBreakCounterP2()) >= 1){
          //타이브레이크 듀스 종료
          scoreComponents.setTieBreakCounterP1(scoreComponents.tieBreakCounterP1()+1);
          scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
          scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
          scoreComponents.addOrderOfPlay(1);
          scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()+1);
          if(isMatchOver(scoreComponents.gameCounterP1())){
            //타이브레이크 종료 후 플레이어1 승리
            scoreComponents.pointLogListP1().add("Win");
            scoreComponents.pointLogListP2().add("Lose");
          }
        }
        else{
          //듀스 또는 애드 상황
          scoreComponents.setTieBreakCounterP1(scoreComponents.tieBreakCounterP1()+1);
          scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
          scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
          scoreComponents.addOrderOfPlay(1);
        }
      }
      else{
        //타이브레이크 듀스 아닐 때
        scoreComponents.setTieBreakCounterP1(scoreComponents.tieBreakCounterP1()+1);
        scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
        scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
        scoreComponents.addOrderOfPlay(1);
        if(isTieBreakOver(scoreComponents.tieBreakCounterP1())){
          //타이브레이크 종료 되었는지 확인
          scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()+1);
          if(isMatchOver(scoreComponents.gameCounterP1())){
            //타이브레이크 종료로 인해 플레이어2 승리
            scoreComponents.pointLogListP1().add("Win");
            scoreComponents.pointLogListP2().add("Lose");
          }
        }
      }
    }else{
      // 타이브레이크 아닐 때
      scoreComponents.setCounterP1(scoreComponents.counterP1()+1);
      if (scoreComponents.counterP1() == 4) {
        // 득점 및 '게임' 승리
        scoreComponents.setCounterP1(scoreComponents.counterP1()-1);
        scoreComponents.saveLastCounterOfGame(scoreComponents.counterP1(), scoreComponents.counterP2());
        scoreComponents.setCounterP1(0);
        scoreComponents.setCounterP2(0);
        scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()+1);
        scoreComponents.addOrderOfPlay(1);
        scoreComponents.addPointToLogP1(scoreComponents.counterP1());
        scoreComponents.addPointToLogP2(scoreComponents.counterP2());
        if(isMatchOver(scoreComponents.gameCounterP1())){
          // 타이브레이크 아니고 플레이어1이 승리
          scoreComponents.pointLogListP1().add("Win");
          scoreComponents.pointLogListP2().add("Lose");
        }
      } else {
        // '게임' 진행 중 득점
        scoreComponents.addOrderOfPlay(1);
        scoreComponents.addPointToLogP1(scoreComponents.counterP1());
        scoreComponents.addPointToLogP2(scoreComponents.counterP2());
      }
    }
  }

  void incrementPointP2(){
    //Player2 득점 상황
    if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
      // 타이브레이크 일 때
      if(scoreComponents.tieBreakCounterP1() >= 6 && scoreComponents.tieBreakCounterP2() >= 6){
        //타이브레이크 듀스일때
        if((scoreComponents.tieBreakCounterP2()-scoreComponents.tieBreakCounterP1()) >= 1){
          //타이브레이크 듀스 종료
          scoreComponents.setTieBreakCounterP2(scoreComponents.tieBreakCounterP2()+1);
          scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
          scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
          scoreComponents.addOrderOfPlay(2);
          scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2()+1);
          if(isMatchOver(scoreComponents.gameCounterP2())){
            //타이브레이크 종료 후 플레이어2 승리
            scoreComponents.pointLogListP2().add("Win");
            scoreComponents.pointLogListP1().add("Lose");
          }
        }
        else{
          //듀스 또는 애드 상황
          scoreComponents.setTieBreakCounterP2(scoreComponents.tieBreakCounterP2()+1);
          scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
          scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
          scoreComponents.addOrderOfPlay(2);
        }
      }
      else{
        //타이브레이크 때 그냥 득점
        scoreComponents.setTieBreakCounterP2(scoreComponents.tieBreakCounterP2()+1);
        scoreComponents.pointLogListP1().add(scoreComponents.tieBreakCounterP1().toString());
        scoreComponents.pointLogListP2().add(scoreComponents.tieBreakCounterP2().toString());
        scoreComponents.addOrderOfPlay(2);
        if(isTieBreakOver(scoreComponents.tieBreakCounterP2())){
          //타이브레이크가 종료 되었는지 확인
          scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2()+1);
          if(isMatchOver(scoreComponents.gameCounterP2())){
            //타이브레이크 종료로 인해 플레이어2 승리
            scoreComponents.pointLogListP2().add("Win");
            scoreComponents.pointLogListP1().add("Lose");
          }
        }
      }
    }else {
      //타이브레이크 아닐 때
      scoreComponents.setCounterP2(scoreComponents.counterP2() + 1);
      if (scoreComponents.counterP2() == 4) {
        // 득점 및 '게임' 승리
        scoreComponents.setCounterP2(scoreComponents.counterP2() - 1);
        scoreComponents.saveLastCounterOfGame(
            scoreComponents.counterP1(), scoreComponents.counterP2());
        scoreComponents.setCounterP1(0);
        scoreComponents.setCounterP2(0);
        scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2() + 1);
        scoreComponents.addOrderOfPlay(2);
        scoreComponents.addPointToLogP1(scoreComponents.counterP1());
        scoreComponents.addPointToLogP2(scoreComponents.counterP2());
        if (isMatchOver(scoreComponents.gameCounterP2())) {
          //타이브레이크 아니고 플레이어2 승리
          scoreComponents.pointLogListP2().add("Win");
          scoreComponents.pointLogListP1().add("Lose");
        }
      } else {
        // '게임' 진행 중 득점
        scoreComponents.addOrderOfPlay(2);
        scoreComponents.addPointToLogP1(scoreComponents.counterP1());
        scoreComponents.addPointToLogP2(scoreComponents.counterP2());
      }
    }
  }

  void undoPoint(){
    //한 포인트 되돌리기
    if (scoreComponents.orderOfPlay().last == 1) {
      // 마지막 득점자가 플레이어1 일 때
      if(isMatchOver(scoreComponents.gameCounterP1())){
        // 매치 종료시 undo 실행
        scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()-1);
        scoreComponents.removeLog();
        if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
          // 타이브레이크 진행 이후 Match Over였을 때
          scoreComponents.setTieBreakCounterP1(scoreComponents.tieBreakCounterP1()-1);
        }
        else{
          // 일반 게임 이후 Match Over였을 때
          scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
          scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
          scoreComponents.removeLastCounterOfGame();
        }
        scoreComponents.removeLog();
      }
      else{
        if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
          // 타이브레이크에서 undo 실행 시
          if(scoreComponents.gameCounterP1() == (gameLength()-1) && scoreComponents.tieBreakCounterP1() == scoreComponents.tieBreakCounterP2() && scoreComponents.tieBreakCounterP1() == 0){
            // 타이브레이크 0:0 상황 시 undo
            scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()-1);
            scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
            scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
            scoreComponents.removeLastCounterOfGame();
          }
          else{
            // 일반 타이브레이크 시 undo
            scoreComponents.setTieBreakCounterP1(scoreComponents.tieBreakCounterP1()-1);
          }
          scoreComponents.removeLog();
        }
        else{
          // 일반 상황에서 undo 실행 시
          if(scoreComponents.gameCounterP1() > 0 && scoreComponents.counterP1() == scoreComponents.counterP2() && scoreComponents.counterP1() == 0){
            // 일반 상황 0:0 에서 undo
            scoreComponents.setGameCounterP1(scoreComponents.gameCounterP1()-1);
            scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
            scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
            scoreComponents.removeLastCounterOfGame();
          }
          else{
            // 일반 상황에서 undo
            scoreComponents.setCounterP1(scoreComponents.counterP1()-1);
          }
          scoreComponents.removeLog();
        }
      }
      scoreComponents.removeOrderOfPlay();
    } else if (scoreComponents.orderOfPlay().last == 2) {
      //플레이어2가 마지막 득점자 일 떄
      if(isMatchOver(scoreComponents.gameCounterP2())){
        // 매치 종료시 undo 실행
        scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2()-1);
        scoreComponents.removeLog();
        if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
          // 타이브레이크 진행 이후 Match Over였을 때
          scoreComponents.setTieBreakCounterP2(scoreComponents.tieBreakCounterP2()-1);
        }
        else{
          // 일반 게임 이후 Match Over였을 때
          scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
          scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
          scoreComponents.removeLastCounterOfGame();
        }
        scoreComponents.removeLog();
      }
      else{
        if(isTieBreak(scoreComponents.gameCounterP1(), scoreComponents.gameCounterP2())){
          // 타이브레이크에서 undo 실행 시
          if(scoreComponents.gameCounterP2() == (gameLength()-1) && scoreComponents.tieBreakCounterP1() == scoreComponents.tieBreakCounterP2() && scoreComponents.tieBreakCounterP1() == 0){
            // 타이브레이크 0:0 상황 시 undo
            scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2()-1);
            scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
            scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
            scoreComponents.removeLastCounterOfGame();
          }
          else{
            // 일반 타이브레이크 시 undo
            scoreComponents.setTieBreakCounterP2(scoreComponents.tieBreakCounterP2()-1);
          }
          scoreComponents.removeLog();
        }
        else{
          // 일반 상황에서 undo 실행 시
          if(scoreComponents.gameCounterP2() > 0 && scoreComponents.counterP1() == scoreComponents.counterP2() && scoreComponents.counterP1() == 0){
            // 일반 상황 0:0 에서 undo
            scoreComponents.setGameCounterP2(scoreComponents.gameCounterP2()-1);
            scoreComponents.setCounterP1(scoreComponents.lastCounterOfGameListP1().last);
            scoreComponents.setCounterP2(scoreComponents.lastCounterOfGameListP2().last);
            scoreComponents.removeLastCounterOfGame();
          }
          else{
            // 일반 상황에서 undo
            scoreComponents.setCounterP2(scoreComponents.counterP2());
          }
          scoreComponents.removeLog();
        }
      }
      scoreComponents.removeOrderOfPlay();
    }
    else{
      scoreComponents.resetPoint();
    }
  }

}

