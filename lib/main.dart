import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Score System',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Tennis Score System'),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          children: [
            Text('NAME',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
            ),
            Text('Tennis',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      )
    );
  }
}
