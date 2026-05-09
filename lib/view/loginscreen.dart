import 'package:flutter/material.dart';
import 'package:relosnews/viewmodel/loginwrapper.dart';

class loginscr extends StatelessWidget {
  const loginscr({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 250,
                width: MediaQuery.of(context).size.height,
                child: Image.asset("assets/loginit2.jpg", fit: BoxFit.cover),
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
                hintText: "Password here",
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
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => loginwrap(email: email.text.trim(), password: password.text.trim()),));
            }, child: Center(child: Text("𝕧𝕖𝕣𝕚𝕗𝕪"))),
          ],
        ),
      ),
    );
  }
}
