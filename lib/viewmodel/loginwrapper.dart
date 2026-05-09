import 'package:flutter/material.dart';
import 'package:relosnews/Services/loginservice.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/view/register_screen.dart';
import 'package:relosnews/view/verify_screen.dart';
import 'package:toastification/toastification.dart';

class loginwrap extends StatelessWidget {
  String email;
  String password;

  loginwrap({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: API_Services(email: email,password: password).fetchdata({
          "emai":email,
          "password":password
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("api called");
            return Newsscreen22();
          } else if (snapshot.hasError) {
            return register();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("kuch toh gadbad hai daya"));
          }
        },
      ),
    );
  }
}
