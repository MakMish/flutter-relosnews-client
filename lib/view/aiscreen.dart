import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:relosnews/Services/aiservice.dart';

class aiscreen extends StatefulWidget {
  String text;

  aiscreen({super.key, required this.text});

  @override
  State<aiscreen> createState() => _aiscreenState();
}

class _aiscreenState extends State<aiscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: aiservice().fetchaidata(widget.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("1");
            print("${snapshot.data}");
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    ConstrainedBox(constraints: BoxConstraints(
                      maxWidth:MediaQuery.of(context).size.width
                    ),child: Center(child: Text("Summarizing with AI 😎😎"),),),
                      Center(
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: false,
                              isRepeatingAnimation: false,

                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "${snapshot.data?.status.toString()}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: Text("Kuch gadbad hai daya"));
          }
        },
      ),
    );
  }
}
