import 'dart:async';
import'package:relosnews/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen extends ConsumerStatefulWidget {
  Screen({super.key});

  @override
  ConsumerState<Screen> createState() => _ScreenState();
}

class _ScreenState extends ConsumerState<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginscr())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Container(
        child: Image.asset("assets/splash_img.png",fit: BoxFit.cover,),
      )),
    );
  }
}
