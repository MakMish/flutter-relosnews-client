import 'package:flutter/material.dart';
import 'package:relosnews/Services//verifyservice.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/view/verify_screen.dart';

class verwrap extends StatelessWidget {
  String email;
  String password;
  verwrap({super.key,required this.password,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: registerservice().fetchdata6(email, password), builder: (context, snapshot) {
        if(snapshot.hasData){
          if(snapshot.data=="ok"){
            return Newsscreen22();
          }
          else if(snapshot.data=="otp invalid"){
            return VerifyScreen(text: "otp invalid");
          }
          else{
            return VerifyScreen(text: "otp expired");
          }
        }
        else{
          return Center(
            child: Text("something is wrong"),
          );
        }
      },),
    );
  }
}
