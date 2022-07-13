import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:tennis_score_system/history.dart';
import 'package:tennis_score_system/socreboard/korean_standard_nodeuce.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:tennis_score_system/socreboard/scoreboard_components.dart';
import 'firebase_options.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tennis_score_system/socreboard/noDeuce_scoreboard_page.dart';

void main() => runApp(const MainMenu());

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: 'Tennis Score System',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const MyHomePage(title: 'Tennis Score System'),
        );
      },
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

  final List<String> gameLengths = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6'
  ];
  String selectedGameLengthAsString = '';
  int chosenGameLength = 0;

  NoDeuceGame ndc = NoDeuceGame();

  void setupGameDiaglog() {
    // 게임 시작을 위한 설정 탭 열기
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
                const Text("Select Game Length"),
                DropdownButton2(
                  hint: const Text('Select Game Length',
                  style: TextStyle(
                    fontSize: 14,
                    ),
                  ),
                  items: gameLengths.map((item) =>
                      DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                      ))
                      .toList(),
                  value: gameLengths[0],
                  onChanged: (item){
                    setState((){
                      selectedGameLengthAsString = item as String;
                      chosenGameLength = int.parse(selectedGameLengthAsString);
                      ndc.setGameLength(chosenGameLength);
                    });
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text('Cancle'),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text('Start Game'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                      const NoDeuceScoreBoardPage()
                      )
                  );
                },
              ),
            ]
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f4f6),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Welcome Player 1",
          style: TextStyle(
            color: Colors.black,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.w, vertical: 58.h), // 양쪽 마진 (여백)
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: InkWell(
                    child: ClipRRect(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Game Start",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: 171.w, // 160
                        height: 171.h, // 180
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const KoreanStandardNodeucePage()
                          )
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  child: InkWell(
                    child: ClipRRect(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "History",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width: 171.w, // 160
                        height: 171.h, // 180
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) =>
                            const HistoryPage()));
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: InkWell(
                child: ClipRRect(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Test",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: 171.w, // 160
                    height: 171.h, // 180
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: (){
                  setupGameDiaglog();
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
