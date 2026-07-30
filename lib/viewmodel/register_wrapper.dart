import 'package:flutter/material.dart';
import 'package:relosnews/Features/loadingscreen.dart';
import 'package:relosnews/Features/toast.dart';
import 'package:relosnews/Services/registerservice.dart';
import 'package:relosnews/view/loginscreen.dart';
import 'package:relosnews/view/verify_screen.dart';
import 'package:toastification/toastification.dart';

class rwrap extends StatelessWidget {
  String name;
  String emial;
  String password;

  rwrap({
    super.key,
    required this.emial,
    required this.password,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: registerservice().fetchdata5({
          "name": name,
          "emai": emial,
          "password": password,
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return liquidload();
          } else if (snapshot.data == 1) {
            Object data = {"name": name, "emai": emial, "password": password};
            WidgetsBinding.instance.addPostFrameCallback((_) {
                tst(
                  context,
                  "OTP is sent to your email\n it will expire in 60 sec 🫡 🫡 ",
                  ToastificationType.success,
                );
            });
            return VerifyScreen(email: emial, data: data);
          }
          else{
            WidgetsBinding.instance.addPostFrameCallback((_){
              tst(context, "error in register", ToastificationType.error);
            });
            return animscr();
          }

        },
      ),
    );
  }
}
