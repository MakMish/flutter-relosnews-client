import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relosnews/viewmodel/registerwrapper.dart';
class register extends ConsumerStatefulWidget {
  register({super.key});

  @override
  ConsumerState<register> createState() => _registerState();
}

class _registerState extends ConsumerState<register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 200,
                width: double.infinity,
                child: Image.asset("assets/register.jpg", fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: "Emial-here",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                ),
                suffix: Icon(Icons.email),
              ),
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              maxLength: 25,
            ),
            SizedBox(height: 30),
            TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: "App-Password ",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                ),
                suffix: Icon(Icons.password),
              ),
              autofocus: true,
              keyboardType: TextInputType.text,
              maxLength: 20,
            ),
            SizedBox(height: 35),
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: "name-here",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                ),
                suffix: Icon(Icons.drive_file_rename_outline),
              ),
              autofocus: true,
              keyboardType: TextInputType.text,
              maxLength: 20,
            ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => registwrap(
                      name: name.text.trim(),
                      email: email.text.trim(),
                      password: password.text.trim(),
                    ),
                  ),
                );
              },
              child: Text("ℝ𝕖𝕘𝕚𝕤𝕥𝕖𝕣"),
            ),
          ],
        ),
      ),
    );
  }
}
