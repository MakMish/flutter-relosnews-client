import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:relosnews/viewmodel/verifywrapper.dart';

class VerifyScreen extends StatefulWidget {
  Object data;
  String email;

  VerifyScreen({super.key, required this.email, required this.data});

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

  bool v = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.purpleAccent, Colors.black87],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Center(
              child: Pinput(
                length: 6,
                controller: _otpController,
                autofocus: true,

                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
                onCompleted: (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => verifywrap(
                        emial: widget.email,
                        data: widget.data,
                        otp: int.parse(_otpController.text.trim()),
                      ),
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }
}
