import 'package:flutter/material.dart';
import 'package:flash_chatt/screens/welcome_screen.dart';
import 'package:flash_chatt/screens/login_screen.dart';
import 'package:flash_chatt/screens/registration_screen.dart';
import 'package:flash_chatt/screens/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
