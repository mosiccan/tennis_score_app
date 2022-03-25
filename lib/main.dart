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
        centerTitle: true,
        title: Text("Tennis"),
      ),
      body: Column(
        children: [
          InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 200,
                height: 200,
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
