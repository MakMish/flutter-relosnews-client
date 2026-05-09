import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:relosnews/view/news2.dart';
import 'package:toastification/toastification.dart';

class VerifyScreen extends StatefulWidget {
  String text;
  VerifyScreen({super.key,required this.text});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Verify OTP")), // Optional
      body: ToastificationWrapper(
        child: Center(
          child: Pinput(
            length: 6,
            controller: _otpController,
            autofocus: true,
            obscureText: true,
            obscuringCharacter: "*",
            defaultPinTheme: PinTheme(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
            ),
            onCompleted: (value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>Newsscreen22()),
              );
              toastification.show(
                context: context,
                type: ToastificationType.info,
                style: ToastificationStyle.flat,
                autoCloseDuration: const Duration(seconds: 3),
                title: Text(widget.text),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Success Screen ko alag class mein rakhein
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        // Full screen image ke liye
        child: Image.network(
          "https://www.shutterstock.com/image-vector/happy-dog-illustration-cool-print-600nw-2278572967.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
