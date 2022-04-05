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
          InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                alignment: Alignment.center,
                child: Text( "Game Start",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
                width: 180,
                height: 180,
                color: Colors.blueAccent.withOpacity(0.4),
              ),
            ),
            onTap: (){
              Navigator.push( context,
                  MaterialPageRoute( builder: (context) => korean_stadard_nodeuce_page() ) );
            },
          ),
        ],
      ),
    );
  }
}
