import 'dart:async';
import'package:relosnews/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/viewmodel/hive.dart';

class Screen extends StatefulWidget {
  bool isverified;
  int idx;
  Screen({super.key,required this.isverified,required this.idx});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      if (widget.isverified == true){
        int pg = hive().getpg();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Newsscreen22(idx: widget.idx, pg: pg),));

      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => animscr(),));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    print("splash screen");
    return Scaffold(
      body: Center(child:Image.asset("assets/splash_screen.png",fit: BoxFit.cover,)),
    );
  }
}
