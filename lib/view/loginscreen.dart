import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:relosnews/Features/bottomsheet.dart';
import 'package:relosnews/Features/toast.dart';
import 'package:relosnews/Services/loginservice.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/viewmodel/hive.dart';
import 'package:rive/rive.dart';
import 'package:toastification/toastification.dart';

class animscr extends StatefulWidget {
  const animscr({super.key});

  @override
  State<animscr> createState() => _animscrState();
}

class _animscrState extends State<animscr> {
  @override
  Widget build(BuildContext context) {
    final fileLoader = FileLoader.fromAsset(
      "assets/toy.riv",
      riveFactory: Factory.rive,
    );

    TextEditingController v = TextEditingController();
    TextEditingController x = TextEditingController();

    return RiveWidgetBuilder(
      fileLoader: fileLoader,
      builder: (context, state) => switch (state) {
        RiveLoading() => Center(child: Text("wait a minute pls😊😊")),
        RiveLoaded() => Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(height: 20),
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.pink],
                        begin: AlignmentGeometry.topEnd,
                        end: AlignmentGeometry.bottomLeft,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: RiveWidget(
                            controller: state.controller,
                            fit: Fit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 2),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.blue,
                            ),
                          ),
                          hintText: "enter email ",
                        ),
                        controller: v,
                        onChanged: (v) {
                          state.controller.stateMachine
                                  .boolean("isFocus")!
                                  .value =
                              true;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.blue,
                            ),
                          ),
                          hintText: "enter password ",
                        ),
                        controller: x,
                        onTap: () {
                          state.controller.stateMachine
                                  .boolean("isFocus")!
                                  .value =
                              false;

                          state.controller.stateMachine
                                  .boolean("IsPassword")!
                                  .value =
                              true;
                        },
                        onSubmitted: (x) {
                          state.controller.stateMachine
                                  .boolean("IsPassword")!
                                  .value =
                              false;
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              tst(
                                context,
                                "verifying,please wait",
                                ToastificationType.success,
                              );
                            });
                            try{
                              final GoogleSignInAccount user =
                              await GoogleSignIn.instance.authenticate();

                              print("Google user: ${user.email}");

                              state.controller.stateMachine
                                  .trigger("login_success")
                                  ?.fire();

                              await Future.delayed(const Duration(seconds: 4));

                              hive().setval();

                              if (!mounted) return;

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Newsscreen22(idx: 0, pg: 1),
                                ),
                              );
                            }
                            catch (e, stackTrace) {
                              print("GOOGLE SIGN-IN ERROR: $e");
                              print(stackTrace);
                            }
                          },
                          icon: Image.asset(
                            'assets/google_logo.png',
                            height: 24.0,
                          ),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 50),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            maximumSize: Size(120, 55),
                          ),
                          onPressed: () async {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              tst(
                                context,
                                "verifying,please wait",
                                ToastificationType.info,
                              );
                            });

                            print("called");

                            int data = await API_Services(
                              email: v.text.trim(),
                              password: x.text.trim(),
                            ).fetchdata();

                            print("yeh rha bhai ////// \n");
                            print(data);

                            if (data == 1) {
                              state.controller.stateMachine
                                  .trigger("login_success")
                                  ?.fire();

                              await Future.delayed(Duration(seconds: 4));

                              hive().setval();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Newsscreen22(idx: 0, pg: 1),
                                ),
                              );
                            } else if (data == 2) {
                              state.controller.stateMachine
                                  .trigger("login_fail")
                                  ?.fire();

                              await Future.delayed(Duration(seconds: 2));

                              bottomsheet(
                                context,
                                "you seems like new user , aren't you",
                                v.text.trim(),
                                x.text.trim(),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                tst(
                                  context,
                                  "please ,try again",
                                  ToastificationType.info,
                                );
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              gradient: LinearGradient(
                                colors: [Colors.pink, Colors.blue],
                                begin: AlignmentGeometry.topEnd,
                                end: AlignmentGeometry.bottomLeft,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
        RiveFailed() => Center(
          child: Text("internal problem, comeback later 😫😫"),
        ),
      },
    );
  }
}
