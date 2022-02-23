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
  List<String> score_list = ["0","15","30","40","Game","No Ad"];
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

  void _incrementCounter_p1() {
    setState(() {
      counter_p1++;
      if(counter_p1 == counter_p2 && counter_p1 == 3){
        counter_p1 += 2;
        getScore(counter_p2 += 2);
      }
    });
  }

  void _increaseCounter_p2() {
    setState(() {
      counter_p2++;
      if(counter_p2 == counter_p1 && counter_p2 == 3){
        counter_p2 += 2;
        getScore(counter_p1 += 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      child: Text(
                        getScore(counter_p1),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      child: Text(':',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0.0, 16, 0.0),
                      child: Text(
                        getScore(counter_p2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: FloatingActionButton.extended(
                      onPressed: _incrementCounter_p1,
                      tooltip: 'Player 1 gets point',
                      icon: Icon(Icons.add),
                      label: Text("Player 1")
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: FloatingActionButton.extended(
                    onPressed: _increaseCounter_p2,
                    tooltip: 'Player 2 gets point',
                    icon: Icon(Icons.add),
                    label: Text("Player 2"),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: FloatingActionButton.extended(
                onPressed: (){},
                elevation: 0.0,
                backgroundColor: Colors.grey,
                  label: Icon(Icons.undo),
              )
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}