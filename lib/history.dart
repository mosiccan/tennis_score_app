import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void history() => runApp(const HistoryPage());

class HistoryPage extends StatelessWidget {

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My History',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHistoryPage(title: 'My History!'),
    );
  }
}

class MyHistoryPage extends StatefulWidget {
  const MyHistoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHistoryPage> createState() => _MyHistoryPageState();
}

class _MyHistoryPageState extends State<MyHistoryPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f4f6),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Game History",
          style: TextStyle(
            color: Colors.black,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

}

