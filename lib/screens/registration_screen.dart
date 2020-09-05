import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chatt/constants.dart';
import 'package:flash_chatt/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chatt/utilitise/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  bool showSpinner = false;

  void getData() async {
    await Firebase.initializeApp();
    final _auth = FirebaseAuth.instance;
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextDecoration,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextDecoration.copyWith(
                  hintText: 'Enter Your Password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Buttons(
                color: Colors.blueAccent,
                onPress: () {
                  setState(() {
                    showSpinner = true;
                  });
                  getData();
                },
                text: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
