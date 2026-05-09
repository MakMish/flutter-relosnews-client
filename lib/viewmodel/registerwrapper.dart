import 'package:flutter/material.dart';
import 'package:relosnews/Services//registerservice.dart';
import 'package:relosnews/view/verify_screen.dart';
import 'package:toastification/toastification.dart';

class registwrap extends StatelessWidget {
  String email;
  String password;
  String name;

  registwrap({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: registerservice().fetchdata5({
          "name": name,
          "emai": email,
          "password": password,
        }),
        builder: (context, snapshot) {
          print("registerverify");
          if (snapshot.hasData) {
            return VerifyScreen(text: "otp sent on email,expires in 60 sec");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: Text("kuch toh gadbad hai daya"));
          }
        },
      ),
    );
  }
}
