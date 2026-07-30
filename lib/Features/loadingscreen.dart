import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class liquidload extends StatelessWidget {
  const liquidload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          "assets/loading.json",
          width: MediaQuery.of(context).size.width/5,
          height: MediaQuery.of(context).size.height/5,
          repeat: true,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

