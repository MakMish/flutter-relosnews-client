import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void tst(BuildContext context,String text2,ToastificationType x){
  toastification.show(
    context: context,
    style: ToastificationStyle.fillColored,
    type: x,
    direction: TextDirection.ltr,
    applyBlurEffect: true,
    backgroundColor: Colors.pinkAccent,
    autoCloseDuration: Duration(seconds: 3),
    description: Text(text2,style: TextStyle(
      color: Colors.white
    ),),
    alignment: AlignmentGeometry.topCenter,

  );
}