import 'package:flutter/material.dart';
import 'package:relosnews/Features/loadingscreen.dart';
import 'package:relosnews/Features/toast.dart';
import 'package:relosnews/Services/verifyservice.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/view/verify_screen.dart';
import 'package:toastification/toastification.dart';
import 'package:relosnews/viewmodel/hive.dart';

class verifywrap extends StatelessWidget {
  String emial;
  Object data;
  int otp;
  verifywrap({
    super.key,
    required this.otp,
    required this.emial,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: verifyservice().fetchdata6(emial, otp,data),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return liquidload();
          } else if (snapshot.data == 1) {
            hive().setval();
            return Newsscreen22(idx: 0,pg:1);
          }
          else{
            WidgetsBinding.instance.addPostFrameCallback((_){
              tst(context, "error in verify", ToastificationType.error);
            });
            return VerifyScreen(email:emial, data: data);
          }
        },
      ),
    );
  }
}
