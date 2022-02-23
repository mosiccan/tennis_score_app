import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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

getScore(int counter){
  List<String> score_list = ["0","15","30","40","Game"];
  return score_list[counter];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter_p1 = 0;
  int counter_p2 = 0;

  void _incrementCounter() {
    setState(() {
      counter_p1++;
    });
  }

  void _decrementCounter(){
    setState(() {
      counter_p2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      padding: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      child: Text(
                        getScore(counter_p1),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 54,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      margin: EdgeInsets.fromLTRB(40, 0.0, 40, 0.0),
                      child: Text(':',
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 54,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      padding: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      child: Text(
                        getScore(counter_p2),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 54,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    icon: Icon(Icons.add),
                    label: Text("Player 1")
                ),
                SizedBox(width: 48,),
                FloatingActionButton.extended(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  icon: Icon(Icons.add),
                  label: Text("Player 2"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}