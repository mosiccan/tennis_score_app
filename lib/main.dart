import 'package:flutter/material.dart';
import 'dart:collection';
import './socreboard/korean_standard_nodeuce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return MaterialApp(
          title: 'Tennis Score System',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const MyHomePage(title: 'Tennis Score System',),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f4f6),
      appBar: AppBar(
        centerTitle: false,
        title: Text("Welcome Player 1",
          style:
          TextStyle(
            color: Colors.black,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 58.h), // 양쪽 마진 (여백)
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: InkWell(
                    child: ClipRRect(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text( "Game Start",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: 171.w, // 160
                        height: 171.h,  // 180
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: (){
                      Navigator.push( context,
                          MaterialPageRoute( builder: (context) => korean_stadard_nodeuce_page() ) );
                    },
                  ),
                ),
                SizedBox(width: 16.w,),
                Container(
                  child: InkWell(
                    child: ClipRRect(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text( "History",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width: 171.w, // 160
                        height: 171.h,  // 180
                        color: Colors.white,
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
      ),
    );
  }
}