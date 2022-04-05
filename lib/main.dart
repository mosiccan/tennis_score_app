import 'package:flutter/material.dart';
import 'dart:collection';
import './socreboard/korean_standard_nodeuce.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Univ Tennis Platform",
          style:
          TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 24, 8, 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      )
                    ]
                ),
                child: InkWell(
                  child: ClipRRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text( "Game Start",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      width: 172, // 160
                      height: 229,  // 180
                      color: Colors.blueAccent.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: (){
                    Navigator.push( context,
                        MaterialPageRoute( builder: (context) => korean_stadard_nodeuce_page() ) );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 24, 16, 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    )
                  ]
                ),
                child: InkWell(
                  child: ClipRRect(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text( "History",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      width: 172, // 160
                      height: 229,  // 180
                      color: Colors.blueGrey.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
